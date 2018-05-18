--
-- Woirld Map Data of the Dungeon Locations addon
--
-- Author: staratnight
-- Date: 31.03.2018
-- Copyright 2018 - Torsten Mingers
--
-- Licensed under the terms of the GNU General Public License (Version 3).
-- You should have received a copy of the GNU General Public License
-- along with Dungeon Locations. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.
--
-- See https://wow.curseforge.com/projects/dungeon-locations/issues to provide bugs or improvements.

local DungeonLocationsWorldMapData, DLoc = ...
local L = DLoc_Locals

local Kalimdor = 13
local EasternKingdoms = 14
local Outland = 466
local Shattrath = 481
local TerrokarForest = 478
local Northrend = 485
local Maelstrom = 751
local Pandaria = 862
local Draenor = 962
local BrokenIsles = 1007
local Argus = 1184

local worldMapIds = { Kalimdor, EasternKingdoms, Outland, Shattrath, TerrokarForest, Northrend, Maelstrom, Pandaria, Draenor, BrokenIsles, Argus }

local worldMapLocations = {}

function SetupWorldMapData()
    local configuration = DLoc:GetConfiguration() 

    if(configuration["showWorldMapLocations"] == false) then
        return
    end

    local dungeons = DLoc:getDungeons()
    local areas = DLoc:getAreas()

    SetupEasternKingdomsWorldMapData(dungeons, areas)
    SetupKalimdorWorldMapData(dungeons, areas)
    SetupOutlandWorldMapData(dungeons, areas)
    SetupNorthrendWorldMapData(dungeons, areas)
    SetupPandariaWorldMapData(dungeons, areas)   
    SetupDraenorWorldMapData(dungeons, areas)
    if(configuration["showLegionWorldMapLocations"]) then
       SetupLegionWorldMapData(dungeons, areas)
    end
    addWorldMapLocation(Maelstrom, 51, 28, areas.id_Deepholm, { dungeons.TheStonecore })
end    

function SetupEasternKingdomsWorldMapData(dungeons, areas)
    addWorldMapLocation(EasternKingdoms, 56, 5.5, areas.id_IsleOfQuelDanas, { dungeons.MagistersTerrace, 
                                                                                dungeons.SunwellPlateau })
    addWorldMapLocation(EasternKingdoms, 56, 25, areas.id_Ghostlands, { dungeons.ZulAman })
    addWorldMapLocation(EasternKingdoms, 53, 32, areas.id_EasternPlaguelands, { dungeons.Stratholme })
    addWorldMapLocation(EasternKingdoms, 49, 34, areas.id_WesternPlaguelands, { dungeons.Scholomance })
    addWorldMapLocation(EasternKingdoms, 45, 32, areas.id_TirisfalGlades, { dungeons.ScarletMonastery, dungeons.ScarletHalls })
    addWorldMapLocation(EasternKingdoms, 41, 41, areas.id_SilverpineForest, { dungeons.ShadowfangKeep })
    addWorldMapLocation(EasternKingdoms, 35, 52, areas.id_TolBarad, { dungeons.BaradinHold })
    addWorldMapLocation(EasternKingdoms, 55, 56, areas.id_TwilightHighlands, { dungeons.GrimBatol, dungeons.TheBastionOfTwilight })
    addWorldMapLocation(EasternKingdoms, 54, 67, areas.id_Badlands, { dungeons.Uldaman })
    addWorldMapLocation(EasternKingdoms, 42, 60, areas.id_DunMorogh, { dungeons.Gnomeregan })
    addWorldMapLocation(EasternKingdoms, 32, 64, areas.id_Vashjir, { dungeons.ThroneOfTheTides })
    addWorldMapLocation(EasternKingdoms, 47, 68, areas.id_BurningSteppes, { dungeons.BlackrockDepths, dungeons.UpperBlackrockSpire, dungeons.LowerBlackrockSpire, dungeons.BlackrockCaverns, 
                                                                                dungeons.MoltenCore, dungeons.BlackwingLair, dungeons.BlackwingDescent })
    addWorldMapLocation(EasternKingdoms, 41, 70, areas.id_Stormwind, { dungeons.TheStockade })
    addWorldMapLocation(EasternKingdoms, 41, 82, areas.id_Westfall, { dungeons.TheDeadmines }) 
    addWorldMapLocation(EasternKingdoms, 52, 79, areas.id_SwampOfSorrows, { dungeons.SunkenTempel }) 
    addWorldMapLocation(EasternKingdoms, 50, 80, areas.id_DeadwindPass, { dungeons.ReturnToKarazhan,
                                                        dungeons.Karazhan })
    addWorldMapLocation(EasternKingdoms, 48, 85, areas.id_StranglethornVale, { dungeons.ZulGurub })
end
function SetupKalimdorWorldMapData(dungeons, areas)
    addWorldMapLocation(Kalimdor, 54, 37, areas.id_MountHyjal, { dungeons.Firelands })
    addWorldMapLocation(Kalimdor, 44, 34, areas.id_Ashenvale, { dungeons.BlackfathomDeeps })
    addWorldMapLocation(Kalimdor, 60, 44, areas.id_Orgrimmar, { dungeons.RagefireChasm })
    addWorldMapLocation(Kalimdor, 52, 52, areas.id_NorthernBarrens, { dungeons.WailingCaverns })
    addWorldMapLocation(Kalimdor, 38, 56, areas.id_Desolace, { dungeons.Maraudon })
    addWorldMapLocation(Kalimdor, 53, 69, areas.id_SouthernBarrens, { dungeons.RazorfenKraul })
    addWorldMapLocation(Kalimdor, 54, 73, areas.id_ThousandNeedles, { dungeons.RazorfenDowns })
    addWorldMapLocation(Kalimdor, 55, 69, areas.id_SwampOfSorrows, { dungeons.OnyxiasLair })
    addWorldMapLocation(Kalimdor, 41, 67, areas.id_Feralas, { dungeons.DireMaulWest, dungeons.DireMaulEast, dungeons.DireMaulNorth })
    addWorldMapLocation(Kalimdor, 42, 85, areas.id_Silithus, { dungeons.RuinsOfAhnQiraj, dungeons.TempleOfAhnQiraj })
    addWorldMapLocation(Kalimdor, 56, 84, areas.id_Tanaris, { dungeons.ZulFarrak, dungeons.EscapeFromDurnholde, dungeons.TheBlackMorass, dungeons.TheCullingOfStratholme, 
                                                                dungeons.WellOfEternity, dungeons.HourOfTwilight, dungeons.EndTime,
                                                                dungeons.TheBattleForMountHyjal, dungeons.Dragonsoul })
    addWorldMapLocation(Kalimdor, 49, 96, areas.id_Uldum, { dungeons.TheVortexPinnacle, dungeons.LostCityOfTheTolvir, dungeons.HallsOfOrigination,
                                                                dungeons.ThroneOfTheFourWinds })
end

function SetupOutlandWorldMapData(dungeons, areas)
    addWorldMapLocation(Outland, 64, 16, areas.id_Netherstorm, { dungeons.TheArcatraz, dungeons.TheBotanica, dungeons.TheMechanar,
                                                                        dungeons.TheEye })
    addWorldMapLocation(Outland, 42, 24, areas.id_BladesEdgeMountains, { dungeons.GruulsLair })
    addWorldMapLocation(Outland, 35, 45, areas.id_Zangarmarsh, { dungeons.TheSlavePens, dungeons.TheUnderbog, dungeons.TheSteamvault,
                                                                        dungeons.SerpentshrineCavern })
    addWorldMapLocation(Outland, 55, 53, areas.id_HellfirePeninsula, { dungeons.HellfireRamparts, dungeons.TheBloodFurnace, dungeons.TheShatteredHalls,
                                                                        dungeons.MagtheridonsLair })
    addWorldMapLocation(Outland, 46, 75, areas.id_TerokkarForest, { dungeons.AuchenaiCrypts, dungeons.SethekkHalls, dungeons.ManaTombs, dungeons.ShadowLabyrinth, dungeons.MagistersTerrace, 
                                                                        dungeons.SunwellPlateau })
    addWorldMapLocation(Outland, 72, 81, areas.id_ShadowmoonValley, { dungeons.TheBlackTemple })

    addWorldMapLocation(Shattrath, 49, 42, areas.id_IsleOfQuelDanas, { dungeons.MagistersTerrace, 
                                                                        dungeons.SunwellPlateau })
    addWorldMapLocation(TerrokarForest, 28, 23, areas.id_Shattrath, { dungeons.MagistersTerrace, 
                                                                        dungeons.SunwellPlateau })
end

function SetupNorthrendWorldMapData(dungeons, areas)
    addWorldMapLocation(Northrend, 58, 16, areas.id_TheStormPeaks, { dungeons.HallsOfLightning, dungeons.HallsOfStone, 
                                                                        dungeons.Ulduar })
    addWorldMapLocation(Northrend, 42, 30, areas.id_Icecrown, { dungeons.TrialOfTheChampion, dungeons.TheForgeOfSouls, dungeons.PitOfSaron , dungeons.TheHallsOfReflection,
                                                                        dungeons.TrialOfTheCrusader, dungeons.IcecrownCitadel })
    addWorldMapLocation(Northrend, 73, 38, areas.id_ZulDrak, { dungeons.Gundrak })
    addWorldMapLocation(Northrend, 48, 40, areas.id_Dalaran, { dungeons.TheVioletHold })
    addWorldMapLocation(Northrend, 36, 44, areas.id_Wintergrasp, { dungeons.VaultOfArchavon })
    addWorldMapLocation(Northrend, 65, 55, areas.id_GrizzlyHills, { dungeons.DrakTharonKeep })
    addWorldMapLocation(Northrend, 50, 51, areas.id_Dragonblight, { dungeons.AzjolNerub, dungeons.AhnKahet, 
                                                                        dungeons.TheRubySanctum, dungeons.TheObsidianSanctum, dungeons.Naxxramas })
    addWorldMapLocation(Northrend, 12, 57, areas.id_BoreanTundra, { dungeons.TheNexus, dungeons.TheOculus, 
                                                                        dungeons.TheEyeOfEternity })
    addWorldMapLocation(Northrend, 80, 76, areas.id_HowlingFjord, { dungeons.UtgardeKeep, dungeons.UtgardePinnacle })          
end

function SetupPandariaWorldMapData(dungeons, areas)
    addWorldMapLocation(Pandaria, 24, 8, areas.id_IsleOfThunder, { dungeons.ThroneOfThunder })
    addWorldMapLocation(Pandaria, 41, 29, areas.id_KunLaiSummit, { dungeons.ShadoPanMonastery,
                                                                                dungeons.MogushanVaults })
    addWorldMapLocation(Pandaria, 22, 49, areas.id_TownlongSteppes, { dungeons.SiegeOfNiuzaoTemple })
    addWorldMapLocation(Pandaria, 55, 54, areas.id_ValeOfEternalBlossom, { dungeons.MogushanPalace, dungeons.GateOfTheSettingSun,
                                                                                dungeons.SiegeOfOrgrimmar })
    addWorldMapLocation(Pandaria, 70, 49, areas.id_TheJadeForest, { dungeons.TempleOfTheJadeSerpent })
    addWorldMapLocation(Pandaria, 57, 52, areas.id_TheVeiledStair, { dungeons.TerraceOfEndlessSpring })
    addWorldMapLocation(Pandaria, 47, 71, areas.id_ValleyOfTheFourWinds, { dungeons.StormstoutBrewery })
    addWorldMapLocation(Pandaria, 32, 64, areas.id_DreadWastes, { dungeons.HeartOfFear })
end

function SetupDraenorWorldMapData(dungeons, areas)
    addWorldMapLocation(Draenor, 50, 26, areas.id_Gorgrond, { dungeons.IronDocks, dungeons.GrimrailDepot, dungeons.TheEverbloom,
                                                                dungeons.BlackrockFoundry })
    addWorldMapLocation(Draenor, 34, 28, areas.id_FrostfireRidge, { dungeons.BloodmaulSlagMines })
    addWorldMapLocation(Draenor, 58, 47, areas.id_TanaanJungle, { dungeons.HellfireCitadel })
    addWorldMapLocation(Draenor, 20, 50, areas.id_Nagrand, { dungeons.Highmaul })
    addWorldMapLocation(Draenor, 39, 62, areas.id_Talador, { dungeons.Auchindoun })
    addWorldMapLocation(Draenor, 54, 67, areas.id_ShadowmoonValley_WOD, { dungeons.ShadowmoonBurialGrounds })
    addWorldMapLocation(Draenor, 43, 74, areas.id_SpiresOfArak, { dungeons.Skyreach  })
end

function SetupLegionWorldMapData(dungeons, areas)
    addWorldMapLocation(BrokenIsles, 47, 27, areas.id_HighMountain, { dungeons.NeltharionsLair })
    addWorldMapLocation(BrokenIsles, 60, 32, areas.id_Stormheim, { dungeons.HallsOfValor, dungeons.MawOfSouls,
                                                                        dungeons.TrialOfValor })
    addWorldMapLocation(BrokenIsles, 33, 33, areas.id_ValSharah, { dungeons.BlackRookHold, dungeons.DarkheartThicket,
                                                                        dungeons.TheEmeraldNightmare })
    addWorldMapLocation(BrokenIsles, 37, 63, areas.id_Azsuna, { dungeons.EyeOfAzshara, dungeons.VaultOfTheWardens})
    addWorldMapLocation(BrokenIsles, 49, 50, areas.id_Suramar, { dungeons.TheArcway, dungeons.CourtOfStars,
                                                                        dungeons.TheNighthold })
    addWorldMapLocation(BrokenIsles, 46, 67, areas.id_DalaranLegion, { dungeons.VioletHold })
    addWorldMapLocation(BrokenIsles, 87, 25, areas.id_Antorus, { dungeons.TheSeatOfTheTriumvirate,
                                                                        dungeons.AntorusTheBurningThrone})
    addWorldMapLocation(BrokenIsles, 57, 62, areas.id_BrokenShore, { dungeons.CathedralOfEternalNight,
                                                    dungeons.TheTombOfSageras   })                                                    

    addWorldMapLocation(Argus, 52, 29, areas.id_MacAree, { dungeons.TheSeatOfTheTriumvirate })                                                    
    addWorldMapLocation(Argus, 35, 57, areas.id_AntoranWastes, { dungeons.AntorusTheBurningThrone })                                                    
end

function addWorldMapLocation(id, x, y, areaId, dungeons)
    worldMapLocations[id][#worldMapLocations[id] + 1] = DLoc:CreateWorldMapLocation(x, y, areaId, dungeons)
end

function DLoc:getWorldMapDungeonLocations(worldMapId)
    return worldMapLocations[worldMapId]
end

function initializeWorldLocationMatrix()
    for k,v in ipairs(worldMapIds) do
        initializeWorldLocationMatrixWithId(v)
    end
end

function initializeWorldLocationMatrixWithId(id)
    worldMapLocations[id] = {}
end

function DLoc:isWorldMapId(id)
    if(worldMapLocations[id] ~= nil) then
        return true
    else
        return false
    end
end

function DLoc:CreateWorldMapLocations()
    initializeWorldLocationMatrix()
    SetupWorldMapData()    
 end