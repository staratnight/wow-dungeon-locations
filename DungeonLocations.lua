--
-- Main file of the Dungeon Locations addon
--
-- Author: staratnight
-- Date: 31.12.2017
-- Copyright 2017 - Torsten Mingers
--
-- Licensed under the terms of the GNU General Public License (Version 3).
-- You should have received a copy of the GNU General Public License
-- along with Dungeon Locations. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.
--
-- See https://wow.curseforge.com/projects/dungeon-locations/issues to provide bugs or improvements.

local DungeonLocations, DLoc = ...
local L = DLoc_Locals

local currentMapId
local initialized = false

local EventListener = CreateFrame("Frame", "Helper")
EventListener:RegisterEvent("ZONE_CHANGED_NEW_AREA")
EventListener:RegisterEvent("WORLD_MAP_UPDATE")
EventListener:RegisterEvent("WORLD_MAP_NAME_UPDATE")
EventListener:RegisterEvent("VARIABLES_LOADED")

local function eventHandler(_, event, arg1)
    if (event == "VARIABLES_LOADED") then
        checkConfigurationVariables(false)
        DLoc:MapTooltipSetup()
        DLoc:CreateLocations()
        DLoc:CreateWorldMapLocations()
        DungeonLocationsBlizzardSettings()

        initialized = true
        DLoc:AddChatMessage(L.LoadingSuccessMessage)
    end
    if(event ~= "VARIABLES_LOADED") then
        if(not initialized) then
            return
        end
        local mapId = GetCurrentMapAreaID()
        DLoc:HideAllDungeonLocations()
        DLoc:ShowDungeonLocations(mapId)
        DLoc:ShowWorldMapDungeonLocations(mapId)
    end
end

EventListener:SetScript("OnEvent", eventHandler)

 function DLoc:CreateLocation(x, y, dungeon)
     local dungeonLocation = CreateFrame("Frame", "Dungeon", WorldMapDetailFrame)
	 
     dungeonLocation.Texture = dungeonLocation:CreateTexture()
     if(dungeon.dungeonType == Type_Dungeon) then
        dungeonLocation.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_dungeon')
     else
        dungeonLocation.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_raid')
     end

     dungeonLocation.Texture:SetAllPoints()
     dungeonLocation:EnableMouse(true)
     dungeonLocation:SetFrameStrata("TOOLTIP")
     dungeonLocation:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 10)

     dungeonLocation:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", (x / 100) * WorldMapDetailFrame:GetWidth(), (-y / 100) * WorldMapDetailFrame:GetHeight())

     dungeonLocation:SetWidth(DungeonLocationsConfig["iconSize"])
     dungeonLocation:SetHeight(DungeonLocationsConfig["iconSize"])
     
     dungeonLocation:HookScript("OnEnter",
         function(pin)
             DLoc_MapTooltip:SetOwner(pin, "ANCHOR_RIGHT")
			 DLoc:BuildInfoTooltip(DLoc_MapTooltip, dungeon)
             DLoc_MapTooltip:Show()
         end
    )
     dungeonLocation:HookScript("OnLeave",
         function()
             DLoc_MapTooltip:Hide()
         end
    )
	dungeonLocation:HookScript("OnMouseDown",
         function()
			if ( not EncounterJournal ) then
				EncounterJournal_LoadUI()
			end
            local _, _, _, _, _, _, _, link = EJ_GetInstanceInfo(dungeon.id)
            local difficulty = string.match(link, 'journal:.-:.-:(.-)|h')
            EncounterJournal_OpenJournal(difficulty, dungeon.id)
         end
    )
     dungeonLocation:Hide()
     return dungeonLocation
 end

 function DLoc:CreateWorldMapLocation(x, y, areaId, dungeons)
    local dungeonLocation = CreateFrame("Frame", "Dungeons", WorldMapDetailFrame)
    
    dungeonLocation.Texture = dungeonLocation:CreateTexture()
    local hasRaids = false
    local hasDungeons = false

    for i = 1, #dungeons do
        if(dungeons[i].dungeonType == Type_Dungeon) then
            hasDungeons = true
        end
        if(dungeons[i].dungeonType == Type_Raid) then
            hasRaids = true
        end
    end

    if(hasDungeons and hasRaids) then 
        dungeonLocation.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_dungeon_raid')
    elseif(hasRaids) then
        dungeonLocation.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_raid')
    else
        dungeonLocation.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_dungeon')
    end

    dungeonLocation.Texture:SetAllPoints()
    dungeonLocation:EnableMouse(true)
    dungeonLocation:SetFrameStrata("TOOLTIP")
    dungeonLocation:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 10)

    dungeonLocation:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", (x / 100) * WorldMapDetailFrame:GetWidth(), (-y / 100) * WorldMapDetailFrame:GetHeight())

    dungeonLocation:SetWidth(DungeonLocationsConfig["iconSize"])
    dungeonLocation:SetHeight(DungeonLocationsConfig["iconSize"])

    dungeonLocation:HookScript("OnEnter",
        function(pin)
            DLoc_MapTooltip:SetOwner(pin, "ANCHOR_RIGHT")
            DLoc:BuildWorldMapInfoTooltip(DLoc_MapTooltip, dungeons)
            DLoc_MapTooltip:Show()
        end
   )
   dungeonLocation:HookScript("OnLeave",
        function()
            DLoc_MapTooltip:Hide()
        end
   )
   dungeonLocation:HookScript("OnMouseDown",
        function()
            SetMapByID(areaId)
        end
    )
    
   dungeonLocation:Hide()
   return dungeonLocation
end

function checkConfigurationVariables(reset)
    if (not DungeonLocationsConfig or reset) then
        DungeonLocationsConfig = {}
    end
    if (not DungeonLocationsConfig["iconSize"] or reset) then
        DungeonLocationsConfig["iconSize"] = 24
    end
    if (not DungeonLocationsConfig["showWorldMapLocations"] or reset) then
        DungeonLocationsConfig["showWorldMapLocations"] = true
    end
    if (not DungeonLocationsConfig["showLegionWorldMapLocations"] or reset) then
        DungeonLocationsConfig["showLegionWorldMapLocations"] = true
    end
    if (not DungeonLocationsConfig["showLegionDungeonLocations"] or reset) then
        DungeonLocationsConfig["showLegionDungeonLocations"] = false
    end
end    

function DungeonLocationsBlizzardSettings() 
    local DungeonLocationsConfigFrame = CreateFrame("FRAME", "DungeonLocationsConfig")
    DungeonLocationsConfigFrame.name = GetAddOnMetadata("DungeonLocations", "Title")
    DungeonLocationsConfigFrame.default = function (self) checkConfigurationVariables(true) end
    DungeonLocationsConfigFrame.refresh = function (self) SetConfigValues() end
    DungeonLocationsConfigFrame:SetScript("OnHide", function(self) ReloadDungeonLocations() end)
    
    InterfaceOptions_AddCategory(DungeonLocationsConfigFrame)

    local ConfigHeader = DungeonLocationsConfigFrame:CreateFontString(nil, "ARTWORK")
    ConfigHeader:SetFontObject(GameFontNormalLarge)
    ConfigHeader:SetJustifyH("LEFT") 
    ConfigHeader:SetJustifyV("TOP")
    ConfigHeader:ClearAllPoints()
    ConfigHeader:SetPoint("TOPLEFT", 16, -16)
    ConfigHeader:SetText( DungeonLocationsConfigFrame.name .. "(" .. GetAddOnMetadata("DungeonLocations", "Version") .. ")")

    local ConfigWorldMapLocations = DungeonLocationsConfigFrame:CreateFontString(nil, "ARTWORK")
    ConfigWorldMapLocations:SetFontObject(GameFontWhite)
    ConfigWorldMapLocations:SetJustifyH("LEFT") 
    ConfigWorldMapLocations:SetJustifyV("TOP")
    ConfigWorldMapLocations:ClearAllPoints()
    ConfigWorldMapLocations:SetPoint("TOPLEFT", ConfigHeader, "BOTTOMLEFT", 2, -10)
    ConfigWorldMapLocations:SetText(L.ConfigCategoryWorldMapLocations)

        local CheckButtonShowWorldMapLocations = CreateFrame("CheckButton", "CheckButtonShowWorldMapLocations", DungeonLocationsConfigFrame, "OptionsCheckButtonTemplate")
        CheckButtonShowWorldMapLocations:SetPoint("TOPLEFT", ConfigWorldMapLocations, "BOTTOMLEFT", 2, -4)
        CheckButtonShowWorldMapLocations:SetScript("OnClick", function(self) SwitchConfiguration("showWorldMapLocations") end)
        CheckButtonShowWorldMapLocationsText:SetText(L.ConfigShowWorldMapLocations)

        local CheckButtonShowLegionWorldMapLocations = CreateFrame("CheckButton", "CheckButtonShowLegionWorldMapLocations", DungeonLocationsConfigFrame, "OptionsCheckButtonTemplate")
        CheckButtonShowLegionWorldMapLocations:SetPoint("TOPLEFT", CheckButtonShowWorldMapLocations, "BOTTOMLEFT", 0, -4)
        CheckButtonShowLegionWorldMapLocations:SetScript("OnClick", function(self) SwitchConfiguration("showLegionWorldMapLocations") end)
        CheckButtonShowLegionWorldMapLocationsText:SetText(L.ConfigShowLegionWorldMapLocations)
    
    local ConfigDungeonLocations = DungeonLocationsConfigFrame:CreateFontString(nil, "ARTWORK")
    ConfigDungeonLocations:SetFontObject(GameFontWhite)
    ConfigDungeonLocations:SetJustifyH("LEFT") 
    ConfigDungeonLocations:SetJustifyV("TOP")
    ConfigDungeonLocations:ClearAllPoints()
    ConfigDungeonLocations:SetPoint("TOPLEFT", CheckButtonShowLegionWorldMapLocations, "BOTTOMLEFT", -2, -10)
    ConfigDungeonLocations:SetText(L.ConfigCategoryDungeonLocations)   

        local CheckButtonShowLegionDungeonLocations = CreateFrame("CheckButton", "CheckButtonShowLegionDungeonLocations", DungeonLocationsConfigFrame, "OptionsCheckButtonTemplate")
        CheckButtonShowLegionDungeonLocations:SetPoint("TOPLEFT", ConfigDungeonLocations, "BOTTOMLEFT", 2, -4)
        CheckButtonShowLegionDungeonLocations:SetScript("OnClick", function(self) SwitchConfiguration("showLegionDungeonLocations") end)
        CheckButtonShowLegionDungeonLocationsText:SetText(L.ConfigShowLegionDungeonLocations)

    local ConfigOther = DungeonLocationsConfigFrame:CreateFontString(nil, "ARTWORK")
    ConfigOther:SetFontObject(GameFontWhite)
    ConfigOther:SetJustifyH("LEFT") 
    ConfigOther:SetJustifyV("TOP")
    ConfigOther:ClearAllPoints()
    ConfigOther:SetPoint("TOPLEFT", CheckButtonShowLegionDungeonLocations, "BOTTOMLEFT", -2, -10)
    ConfigOther:SetText(L.ConfigCategoryOther)   

        local IconSizeSliderFrame = CreateFrame("Frame", nil, DungeonLocationsConfigFrame)
        IconSizeSliderFrame:SetSize(200, 48)    
        IconSizeSliderFrame:SetPoint("TOPLEFT", ConfigOther, "BOTTOMLEFT", 2, -24)
            local IconSizeSlider = CreateFrame("Slider", "IconSizeSlider", IconSizeSliderFrame, "OptionsSliderTemplate")
            IconSizeSlider:SetHeight(17)
            IconSizeSlider:SetPoint("TOPLEFT", IconSizeSliderFrame, "TOPLEFT", 0, 0)
            IconSizeSlider:SetOrientation("HORIZONTAL")
            IconSizeSlider:SetWidth(150)
            IconSizeSlider:SetValueStep(1)
            IconSizeSlider:SetValue(DungeonLocationsConfig["iconSize"])

            IconSizeSlider:SetMinMaxValues(18, 40)
            local SliderText = getglobal(IconSizeSlider:GetName() .. 'Text')
            local SliderLowText = getglobal(IconSizeSlider:GetName() .. 'Low')
            local SliderHighText = getglobal(IconSizeSlider:GetName() .. 'High')
            SliderText:SetText(L.IconSize)
            SliderText:SetFontObject(GameFontNormal)
            SliderLowText:SetText(18)
            SliderLowText:SetFontObject(GameFontNormal)
            SliderHighText:SetText(40)
            SliderHighText:SetFontObject(GameFontNormal)

            local IconPreview = CreateFrame("Frame", "IconPreview", IconSizeSliderFrame)
            IconPreview.Texture = IconPreview:CreateTexture()
            IconPreview.Texture:SetTexture('Interface\\Addons\\DungeonLocations\\Art\\portal_dungeon_raid')
            IconPreview.Texture:SetAllPoints()
            IconPreview:EnableMouse(false)
            IconPreview:SetFrameStrata("TOOLTIP")
            IconPreview:SetWidth(DungeonLocationsConfig["iconSize"])
            IconPreview:SetHeight(DungeonLocationsConfig["iconSize"])
            IconPreview:SetPoint("LEFT", IconSizeSlider, "RIGHT", 30, 0)
            
            IconSizeSlider:SetScript("OnValueChanged", 
                function(self)  
                    local value = floor(self:GetValue() / self:GetValueStep()) * self:GetValueStep()
                    if(DungeonLocationsConfig["iconSize"] == value) then
                        return
                    end
                    DungeonLocationsConfig["iconSize"] = value
                    self:SetValue(value)
                    IconPreview:SetWidth(DungeonLocationsConfig["iconSize"])
                    IconPreview:SetHeight(DungeonLocationsConfig["iconSize"])
                end
            )
end

function SetConfigValues()
    CheckButtonShowWorldMapLocations:SetChecked(DungeonLocationsConfig["showWorldMapLocations"])
    CheckButtonShowLegionWorldMapLocations:SetChecked(DungeonLocationsConfig["showLegionWorldMapLocations"])
    CheckButtonShowLegionDungeonLocations:SetChecked(DungeonLocationsConfig["showLegionDungeonLocations"])
    IconSizeSlider:SetValue(DungeonLocationsConfig["iconSize"])
end

function SwitchConfiguration(configration)
    DungeonLocationsConfig[configration] = not DungeonLocationsConfig[configration]
    SetConfigValues()
end

function ReloadDungeonLocations()
    DLoc:HideAllDungeonLocations()
    DLoc:CreateLocations()
    DLoc:CreateWorldMapLocations()
end

function DLoc:HideAllDungeonLocations()
    if(currentMapId == nil) then
        return
    end
    
    if(DLoc:isWorldMapId(currentMapId)) then
        local locations = DLoc:getWorldMapDungeonLocations(currentMapId)
        for i = 1, #locations do
            locations[i]:Hide()
        end
    end
    if(DLoc:hasId(currentMapId)) then
        local locations = DLoc:getDungeonLocations()	 
        for i = 1, #locations[currentMapId] do
            locations[currentMapId][i]:Hide()
        end
    end
    currentMapId = nil
 end

function DLoc:ShowDungeonLocations(worldMapId)
    if(DLoc:hasId(worldMapId) == false) then
        return
    end

	local realWorldMapId = DLoc:DetermineAreaIdForSpecialMapAreas(worldMapId)
	if(realWorldMapId == nil) then
		return
	end
	 
    local locations = DLoc:getDungeonLocations()
    for i = 1, #locations[worldMapId] do
        locations[worldMapId][i]:Show()
    end
    currentMapId = worldMapId
 end
 
function DLoc:ShowWorldMapDungeonLocations(worldMapId)
    if(DLoc:isWorldMapId(worldMapId) == false) then
        return
    end

    local locations = DLoc:getWorldMapDungeonLocations(worldMapId)
    for i = 1, #locations do
        locations[i]:Show()
    end
    currentMapId = worldMapId
end

function DLoc:MapTooltipSetup()
    DLoc_MapTooltip = CreateFrame("GameTooltip", "DLoc_MapTooltip", WorldMapFrame, "GameTooltipTemplate")
    DLoc_MapTooltip:SetFrameStrata("TOOLTIP")
    DLoc_MapTooltip:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 20)
    WorldMapFrame:HookScript("OnSizeChanged",
        function(self)
            DLoc_MapTooltip:SetScale(1 / self:GetScale())
        end
    )
end

function DLoc:BuildInfoTooltip(DLoc_MapTooltip, dungeon)
	DLoc_MapTooltip:ClearLines()
	DLoc_MapTooltip:AddDoubleLine(dungeon.name, dungeon.level, 1, 1, 1, false)
	
	local difficulty = L.DiffNormal
	if(dungeon.heroic) then
		difficulty = string.format("%s/%s", difficulty, L.DiffHero)
	end
	if(dungeon.mythic) then
		difficulty = string.format("%s/%s", difficulty, L.DiffMythic)
	end
	DLoc_MapTooltip:AddLine(difficulty, 1, 1, 1, false)
		
	if(dungeon.dungeonType == Type_Raid) then
		players = string.format("%s: %s", L.Players, dungeon.player)
		DLoc_MapTooltip:AddLine(players, 1, 1, 1, false)
	end
	
	if(dungeon.additionalInfo) then
		DLoc_MapTooltip:AddLine(dungeon.additionalInfo, nil, nil, nil, true)
	end
end

function DLoc:BuildWorldMapInfoTooltip(DLoc_MapTooltip, dungeons)
	DLoc_MapTooltip:ClearLines()
	DLoc_MapTooltip:AddLine(L.DungeonsInThisArea, 1, 1, 1, false)
    
    for i = 1, #dungeons do
        local type
        if(dungeons[i].dungeonType == Type_Raid) then
            type = L.TypeRaid
        else
            type = L.TypeDungeon
        end
        DLoc_MapTooltip:AddDoubleLine(dungeons[i].name, type .. " (" .. dungeons[i].level .. ")", 1, 1, 1, false)
    end
end

function DLoc:AddChatMessage(message)
    DEFAULT_CHAT_FRAME:AddMessage(message, 1, 1, 0)
end

function DLoc:GetConfiguration() 
    return DungeonLocationsConfig
end