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

local DungeonLocationsData, DLoc = ...
local L = DLoc_Locals

local areas
local dungeons
local dungeonLocations

local PLAYERS_10_25 = "10/25"
local PLAYERS_10_30 = "10/30"
local PLAYERS_10 = "10"
local PLAYERS_25 = "25"
local PLAYERS_40 = "40"

Type_Dungeon, Type_Raid = 0, 1
	
function setupAreaData() 
	areas.id_AbyssalDepth = 614
	areas.id_AhnQiraj = 772
	areas.id_Antorus = 1184
	areas.id_AntoranWastes = 1171
	areas.id_Ashenvale = 43
	areas.id_Azsuna = 1015
	areas.id_Badlands = 17
	areas.id_BladesEdgeMountains = 475
	areas.id_BoreanTundra = 486
	areas.id_BrokenShore = 1021
	areas.id_BurningSteppes = 29
	areas.id_CrystalsongForest = 510
	areas.id_Dalaran = 504
	areas.id_DalaranLegion = 1014
	areas.id_DeadwindPass = 32
	areas.id_Deepholm = 640
	areas.id_Desolace = 101
	areas.id_Dragonblight = 488
	areas.id_DreadWastes = 858
	areas.id_DunMorogh = 27
	areas.id_DustwallowMarsh = 141
	areas.id_EasternPlaguelands = 23
	areas.id_Feralas = 121
	areas.id_FrostfireRidge = 941
	areas.id_Ghostlands = 463
	areas.id_Gorgrond = 949
	areas.id_GrizzlyHills = 490
	areas.id_HellfirePeninsula = 465
	areas.id_HowlingFjord = 491
	areas.id_HighMountain = 1024
	areas.id_Icecrown = 492
	areas.id_IsleOfQuelDanas = 499
	areas.id_IsleOfThunder = 928
	areas.id_KunLaiSummit = 809
	areas.id_MacAree = 1170
	areas.id_MountHyjal = 606
	areas.id_Nagrand = 950
	areas.id_Netherstorm = 479
	areas.id_NorthernBarrens = 11
	areas.id_NorthernStranglethorn = 37
	areas.id_Orgrimmar = 321
	areas.id_ShadowmoonValley = 473
	areas.id_ShadowmoonValley_WOD = 947
	areas.id_Shattrath = 481
	areas.id_Silithus = 261
	areas.id_SilverpineForest = 21
	areas.id_SouthernBarrens = 607
	areas.id_SpiresOfArak = 948
	areas.id_Stormheim = 1017
	areas.id_Stormwind = 301
	areas.id_StranglethornVale = 689
	areas.id_Suramar = 1033
	areas.id_SwampOfSorrows = 38
	areas.id_Talador = 946
	areas.id_TanaanJungle = 945
	areas.id_Tanaris = 161
	areas.id_TerokkarForest = 478
	areas.id_TheJadeForest = 806
	areas.id_TheStormPeaks = 495
	areas.id_TheVeiledStair = 873
	areas.id_ThousandNeedles = 61
	areas.id_TirisfalGlades = 20
	areas.id_TolBarad = 708
	areas.id_TownlongSteppes = 810
	areas.id_TwilightHighlands = 700
	areas.id_Uldum = 720
	areas.id_ValeOfEternalBlossom = 811
	areas.id_ValleyOfTheFourWinds = 807
	areas.id_ValSharah = 1018
	areas.id_Vashjir = 613
	areas.id_WesternPlaguelands = 22
	areas.id_Westfall = 39
	areas.id_Wintergrasp = 501
	areas.id_Zangarmarsh = 467
	areas.id_ZulDrak = 496
end	

function setupDungeonData() 
	dungeons.AhnKahet = { id = 271, name = EJ_GetInstanceInfo(271), dungeonType = Type_Dungeon, level = "61-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.AhnKahetInfoText }
	dungeons.AntorusTheBurningThrone = { id = 946, name = EJ_GetInstanceInfo(946), dungeonType = Type_Raid, level = "110", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.AntorusTheBurningThroneInfoText }
	dungeons.AuchenaiCrypts = { id = 247, name = EJ_GetInstanceInfo(247), dungeonType = Type_Dungeon, level = "63-80", heroic = true, mythic = false, additionalInfo = L.AuchenaiCryptsInfoText }
	dungeons.Auchindoun = { id = 547, name = EJ_GetInstanceInfo(547), dungeonType = Type_Dungeon, level = "95-100", heroic = true, mythic = true, additionalInfo = L.AuchindounInfoText }
	dungeons.AzjolNerub = { id = 272, name = EJ_GetInstanceInfo(272), dungeonType = Type_Dungeon, level = "60-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.AzjolNerubInfoText }
	dungeons.BaradinHold = { id = 75, name = EJ_GetInstanceInfo(75), dungeonType = Type_Raid, level = "85", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.BaradinHoldInfoText }
	dungeons.BlackfathomDeeps = { id = 227, name = EJ_GetInstanceInfo(227), dungeonType = Type_Dungeon, level = "20-60", heroic = false, mythic = false, additionalInfo = L.BlackfathomDeepsInfoText }
	dungeons.BlackrockCaverns = { id = 66, name = EJ_GetInstanceInfo(66), dungeonType = Type_Dungeon, level = "80-90 / 85", heroic = true, mythic = false, additionalInfo = L.BlackrockCavernsInfoText }
	dungeons.BlackrockDepths = { id = 228, name = EJ_GetInstanceInfo(228), dungeonType = Type_Dungeon, level = "47-60", heroic = false, mythic = false, additionalInfo = L.BlackrockDepthsInfoText }
	dungeons.BlackrockFoundry = { id = 457, name = EJ_GetInstanceInfo(457), dungeonType = Type_Raid, level = "100", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.BlackrockFoundryInfoText }
	dungeons.BlackRookHold = { id = 740, name = EJ_GetInstanceInfo(740), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.BlackRookHoldInfoText }
	dungeons.BlackwingDescent = { id = 73, name = EJ_GetInstanceInfo(73), dungeonType = Type_Raid, level = "100", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.BlackwingDescentInfoText }
	dungeons.BlackwingLair = { id = 742, name = EJ_GetInstanceInfo(742), dungeonType = Type_Raid, level = "60", heroic = false, mythic = false, player = PLAYERS_40, additionalInfo = L.BlackwingLairInfoText }
	dungeons.BloodmaulSlagMines = { id = 385, name = EJ_GetInstanceInfo(385), dungeonType = Type_Dungeon, level = "90-100", heroic = true, mythic = true, additionalInfo = L.BloodmaulSlagMinesInfoText }
	dungeons.CathedralOfEternalNight = { id = 900, name = EJ_GetInstanceInfo(900), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.CathedralOfEternalNightInfoText }
	dungeons.CourtOfStars = { id = 800, name = EJ_GetInstanceInfo(800), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.CourtOfStarsInfoText }
	dungeons.DarkheartThicket = { id = 762, name = EJ_GetInstanceInfo(762), dungeonType = Type_Dungeon, level = "98-110", heroic = true, mythic = true, additionalInfo = L.DarkheartThicketInfoText }
	dungeons.DireMaulWest = { id = 230, name = EJ_GetInstanceInfo(230) .. L.DireMaulWest, dungeonType = Type_Dungeon, level = "39-60", heroic = false, mythic = false, additionalInfo = L.DireMaulWestInfoText }
	dungeons.DireMaulEast = { id = 230, name = EJ_GetInstanceInfo(230) .. L.DireMaulEast, dungeonType = Type_Dungeon, level = "36-60", heroic = false, mythic = false, additionalInfo = L.DireMaulEastInfoText }
	dungeons.DireMaulNorth = { id = 230, name = EJ_GetInstanceInfo(230) .. L.DireMaulNorth, dungeonType = Type_Dungeon, level = "42-60", heroic = false, mythic = false, additionalInfo = L.DireMaulNorthInfoText }
	dungeons.Dragonsoul = { id = 187, name = EJ_GetInstanceInfo(187), dungeonType = Type_Raid, level = "85", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.DragonsoulInfoText }
	dungeons.EscapeFromDurnholde = { id = 251, name = EJ_GetInstanceInfo(251), dungeonType = Type_Dungeon, level = "64-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.EscapeFromDurnholdeInfoText }
	dungeons.EndTime = { id = 184, name = EJ_GetInstanceInfo(184), dungeonType = Type_Dungeon, level = "85", heroic = true, mythic = false, additionalInfo = L.EndTimeInfoText }
	dungeons.EyeOfAzshara = { id = 716, name = EJ_GetInstanceInfo(716), dungeonType = Type_Dungeon, level = "98-110", heroic = true, mythic = true, additionalInfo = L.EyeOfAzsharaInfoText }
	dungeons.DrakTharonKeep = { id = 273, name = EJ_GetInstanceInfo(273), dungeonType = Type_Dungeon, level = "62-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.DrakTharonKeepInfoText }
	dungeons.Firelands = { id = 78, name = EJ_GetInstanceInfo(78), dungeonType = Type_Raid, level = "85", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.FirelandsInfoText }
	dungeons.GateOfTheSettingSun = { id = 303, name = EJ_GetInstanceInfo(303), dungeonType = Type_Dungeon, level = "83-90 / 90", heroic = true, mythic = false, additionalInfo = L.GateOfTheSettingSunInfoText }
	dungeons.Gnomeregan = { id = 231, name = EJ_GetInstanceInfo(231), dungeonType = Type_Dungeon, level = "24-60", heroic = false, mythic = false, additionalInfo = L.GnomereganInfoText }
	dungeons.GrimBatol = { id = 71, name = EJ_GetInstanceInfo(71), dungeonType = Type_Dungeon, level = "84-90 / 85", heroic = true, mythic = false, additionalInfo = L.GrimBatolInfoText }
	dungeons.GrimrailDepot = { id = 536, name = EJ_GetInstanceInfo(536), dungeonType = Type_Dungeon, level = "100", heroic = true, mythic = true, additionalInfo = L.GrimrailDepotInfoText }
	dungeons.GruulsLair = { id = 746, name = EJ_GetInstanceInfo(746), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.GruulsLairInfoText }
	dungeons.Gundrak = { id = 274, name = EJ_GetInstanceInfo(274), dungeonType = Type_Dungeon, level = "64-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.GundrakInfoText }
	dungeons.HallsOfLightning = { id = 275, name = EJ_GetInstanceInfo(275), dungeonType = Type_Dungeon, level = "67-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.HallsOfLightningInfoText }
	dungeons.HallsOfOrigination = { id = 70, name = EJ_GetInstanceInfo(70), dungeonType = Type_Dungeon, level = "84-90 / 85", heroic = true, mythic = false, additionalInfo = L.HallsOfOriginationInfoText }
	dungeons.HallsOfStone = { id = 277, name = EJ_GetInstanceInfo(277), dungeonType = Type_Dungeon, level = "65-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.HallsOfStoneInfoText }
	dungeons.HallsOfValor = { id = 721, name = EJ_GetInstanceInfo(721), dungeonType = Type_Dungeon, level = "98-110", heroic = true, mythic = true, additionalInfo = L.HallsOfValorInfoText }
	dungeons.HeartOfFear = { id = 330, name = EJ_GetInstanceInfo(330), dungeonType = Type_Raid, level = "90", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.HeartOfFearInfoText }
	dungeons.HellfireCitadel = { id = 669, name = EJ_GetInstanceInfo(669), dungeonType = Type_Raid, level = "100", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.HellfireCitadelInfoText }
	dungeons.HellfireRamparts = { id = 248, name = EJ_GetInstanceInfo(248), dungeonType = Type_Dungeon, level = "58-80", heroic = true, mythic = false, additionalInfo = L.HellfireRampartsInfoText }
	dungeons.Highmaul = { id = 477, name = EJ_GetInstanceInfo(477), dungeonType = Type_Raid, level = "100", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.HighmaulInfoText }
	dungeons.HourOfTwilight = { id = 186, name = EJ_GetInstanceInfo(186), dungeonType = Type_Dungeon, level = "85", heroic = true, mythic = false, additionalInfo = L.HourOfTwilightInfoText }
	dungeons.IcecrownCitadel = { id = 758, name = EJ_GetInstanceInfo(758), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.IcecrownCitadelInfoText }
	dungeons.IronDocks = { id = 558, name = EJ_GetInstanceInfo(558), dungeonType = Type_Dungeon, level = "92-100", heroic = true, mythic = true, additionalInfo = L.IronDocksInfoText }
	dungeons.Karazhan = { id = 745, name = EJ_GetInstanceInfo(745), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_10, additionalInfo = L.KarazhanInfoText }
	dungeons.LostCityOfTheTolvir = { id = 69, name = EJ_GetInstanceInfo(69), dungeonType = Type_Dungeon, level = "84-90 / 85", heroic = true, mythic = false, additionalInfo = L.LostCityOfTheTolvirInfoText }
	dungeons.LowerBlackrockSpire = { id = 229, name = EJ_GetInstanceInfo(229), dungeonType = Type_Dungeon, level = "55-60", heroic = false, mythic = false, additionalInfo = L.LowerBlackrockSpireInfoText }
	dungeons.MagistersTerrace = { id = 249, name = EJ_GetInstanceInfo(249), dungeonType = Type_Dungeon, level = "68-80", heroic = true, mythic = false, additionalInfo = L.MagistersTerraceInfoText }
	dungeons.MagtheridonsLair = { id = 747, name = EJ_GetInstanceInfo(747), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.MagtheridonsLairInfoText }
	dungeons.ManaTombs = { id = 250, name = EJ_GetInstanceInfo(250), dungeonType = Type_Dungeon, level = "62-80", heroic = true, mythic = false, additionalInfo = L.ManaTombsInfoText }
	dungeons.Maraudon = { id = 232, name = EJ_GetInstanceInfo(232), dungeonType = Type_Dungeon, level = "30-60", heroic = false, mythic = false, additionalInfo = L.MaraudonInfoText }
	dungeons.MawOfSouls = { id = 727, name = EJ_GetInstanceInfo(727), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.MawOfSOulsInfoText }
	dungeons.MogushanPalace = { id = 321, name = EJ_GetInstanceInfo(321), dungeonType = Type_Dungeon, level = "82-90 / 90", heroic = true, mythic = false, additionalInfo = L.MogushanPalaceInfoText }
	dungeons.MogushanVaults = { id = 317, name = EJ_GetInstanceInfo(317), dungeonType = Type_Raid, level = "90", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.MogushanVaultsInfoText }
	dungeons.MoltenCore = { id = 741, name = EJ_GetInstanceInfo(741), dungeonType = Type_Raid, level = "60", heroic = false, mythic = false, player = PLAYERS_40, additionalInfo = L.MoltenCoreInfoText }
	dungeons.Naxxramas = { id = 754, name = EJ_GetInstanceInfo(754), dungeonType = Type_Raid, level = "80-83", heroic = false, mythic = false, player = PLAYERS_10_25, additionalInfo = L.NaxxramasInfoText }
	dungeons.NeltharionsLair = { id = 767, name = EJ_GetInstanceInfo(767), dungeonType = Type_Dungeon, level = "98-110", heroic = true, mythic = true, additionalInfo = L.NeltharionsLairInfoText }
	dungeons.OnyxiasLair  = { id = 760, name = EJ_GetInstanceInfo(760), dungeonType = Type_Raid, level = "80-83", heroic = false, mythic = false, player = PLAYERS_10_25, additionalInfo = L.OnyxiasLairInfoText }
	dungeons.PitOfSaron = { id = 278, name = EJ_GetInstanceInfo(278), dungeonType = Type_Dungeon, level = "70-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.PitOfSaronInfoText }
	dungeons.RagefireChasm = { id = 226, name = EJ_GetInstanceInfo(226), dungeonType = Type_Dungeon, level = "15-60", heroic = false, mythic = false, additionalInfo = L.RagefireChasmInfoText }
	dungeons.RazorfenDowns = { id = 233, name = EJ_GetInstanceInfo(233), dungeonType = Type_Dungeon, level = "35-60", heroic = false, mythic = false, additionalInfo = L.RazorfenDownsInfoText }
	dungeons.RazorfenKraul = { id = 234, name = EJ_GetInstanceInfo(234), dungeonType = Type_Dungeon, level = "30-60", heroic = false, mythic = false, additionalInfo = L.RazorfenKraulInfoText }
	dungeons.ReturnToKarazhan = { id = 860, name = EJ_GetInstanceInfo(860), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.ReturnToKarazhanInfoText }
	dungeons.RuinsOfAhnQiraj = { id = 743, name = EJ_GetInstanceInfo(743), dungeonType = Type_Raid, level = "60", heroic = false, mythic = false, player = PLAYERS_10, additionalInfo = L.RuinsOfAhnQirajInfoText }
	dungeons.ScarletHalls = { id = 311, name = EJ_GetInstanceInfo(311), dungeonType = Type_Dungeon, level = "26-60 / 90", heroic = true, mythic = false, additionalInfo = L.ScarletHallsInfoText }
	dungeons.ScarletMonastery = { id = 316, name = EJ_GetInstanceInfo(316), dungeonType = Type_Dungeon, level = "28-60 / 90", heroic = true, mythic = false, additionalInfo = L.ScarletMonasteryInfoText }
	dungeons.Scholomance = { id = 246, name = EJ_GetInstanceInfo(246), dungeonType = Type_Dungeon, level = "38-60 / 90", heroic = true, mythic = false, additionalInfo = L.ScholomanceInfoText }
	dungeons.SerpentshrineCavern = { id = 748, name = EJ_GetInstanceInfo(748), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.SerpentshrineCavernInfoText }
	dungeons.SethekkHalls = { id = 252, name = EJ_GetInstanceInfo(252), dungeonType = Type_Dungeon, level = "65-80", heroic = true, mythic = false, additionalInfo = L.SethekkHallsInfoText }
	dungeons.ShadoPanMonastery = { id = 312, name = EJ_GetInstanceInfo(312), dungeonType = Type_Dungeon, level = "82-90 / 90", heroic = true, mythic = false, additionalInfo = L.ShadoPanMonasteryInfoText }
	dungeons.ShadowfangKeep = { id = 64, name = EJ_GetInstanceInfo(64), dungeonType = Type_Dungeon, level = "20-60 / 85", heroic = true, mythic = false, additionalInfo = L.ShadowfangKeepInfoText }
	dungeons.ShadowLabyrinth = { id = 253, name = EJ_GetInstanceInfo(253), dungeonType = Type_Dungeon, level = "67-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.ShadowLabyrinthInfoText }
	dungeons.ShadowmoonBurialGrounds = { id = 537, name = EJ_GetInstanceInfo(537), dungeonType = Type_Dungeon, level = "100", heroic = true, mythic = true, additionalInfo = L.ShadowmoonBurialGroundsInfoText }
	dungeons.SiegeOfNiuzaoTemple = { id = 324, name = EJ_GetInstanceInfo(324), dungeonType = Type_Dungeon, level = "83-90 / 90", heroic = true, mythic = false, additionalInfo = L.SiegeOfNiuzaoTempleInfoText }
	dungeons.SiegeOfOrgrimmar = { id = 369, name = EJ_GetInstanceInfo(369), dungeonType = Type_Raid, level = "90", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.SiegeOfOrgrimmarInfoText }
	dungeons.Skyreach = { id = 476, name = EJ_GetInstanceInfo(476), dungeonType = Type_Dungeon, level = "97-100", heroic = true, mythic = true, additionalInfo = L.SkyreachInfoText }
	dungeons.StormstoutBrewery = { id = 302, name = EJ_GetInstanceInfo(302), dungeonType = Type_Dungeon, level = "80-90 / 90", heroic = true, mythic = false, additionalInfo = L.StormstoutBreweryInfoText }
	dungeons.Stratholme = { id = 236, name = EJ_GetInstanceInfo(236), dungeonType = Type_Dungeon, level = "42-60", heroic = false, mythic = false, additionalInfo = L.StratholmeInfoText }
	dungeons.StratholmeBack = { id = 236, name = EJ_GetInstanceInfo(236) .. L.StratholmeBack, dungeonType = Type_Dungeon, level = "46-60", heroic = false, mythic = false, additionalInfo = L.StratholmeBackInfoText }
	dungeons.SunkenTempel = { id = 237, name = EJ_GetInstanceInfo(237), dungeonType = Type_Dungeon, level = "50-60", heroic = false, mythic = false, additionalInfo = L.SunkenTempelInfoText }
	dungeons.SunwellPlateau = { id = 752, name = EJ_GetInstanceInfo(752), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.SunwellPlateauInfoText }
	dungeons.TempleOfAhnQiraj = { id = 744, name = EJ_GetInstanceInfo(744), dungeonType = Type_Raid, level = "60", heroic = false, mythic = false, player = PLAYERS_40, additionalInfo = L.TempleOfAhnQirajInfoText }
	dungeons.TempleOfTheJadeSerpent = { id = 313, name = EJ_GetInstanceInfo(313), dungeonType = Type_Dungeon, level = "80-90 / 90", heroic = true, mythic = false, additionalInfo = L.TempleOfTheJadeSerpentInfoText }
	dungeons.TerraceOfEndlessSpring = { id = 320, name = EJ_GetInstanceInfo(320), dungeonType = Type_Raid, level = "90", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TerraceOfEndlessSpringInfoText }
	dungeons.TheArcatraz = { id = 254, name = EJ_GetInstanceInfo(254), dungeonType = Type_Dungeon, level = "68-80", heroic = true, mythic = false, additionalInfo = L.TheArcatrazInfoText }
	dungeons.TheArcway = { id = 726, name = EJ_GetInstanceInfo(726), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.TheArcwayInfoText }
	dungeons.TheBastionOfTwilight = { id = 72, name = EJ_GetInstanceInfo(72), dungeonType = Type_Raid, level = "85", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TheBastionOfTwilightInfoText }
	dungeons.TheBattleForMountHyjal  = { id = 750, name = EJ_GetInstanceInfo(750), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.TheBattleForMountHyjalInfoText }
	dungeons.TheBlackMorass = { id = 255, name = EJ_GetInstanceInfo(255), dungeonType = Type_Dungeon, level = "68-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheBlackMorassInfoText }
	dungeons.TheBlackTemple = { id = 751, name = EJ_GetInstanceInfo(751), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_10_30, additionalInfo = L.TheBlackTempleInfoText }
	dungeons.TheBloodFurnace = { id = 256, name = EJ_GetInstanceInfo(256), dungeonType = Type_Dungeon, level = "59-80", heroic = true, mythic = false, additionalInfo = L.TheBloodFurnaceInfoText }
	dungeons.TheBotanica = { id = 257, name = EJ_GetInstanceInfo(257), dungeonType = Type_Dungeon, level = "67-80", heroic = true, mythic = false, additionalInfo = L.TheBotanicaInfoText }
	dungeons.TheCullingOfStratholme = { id = 279, name = EJ_GetInstanceInfo(279), dungeonType = Type_Dungeon, level = "68-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheCullingOfStratholmeInfoText }
	dungeons.TheDeadmines = { id = 63, name = EJ_GetInstanceInfo(63), dungeonType = Type_Dungeon, level = "15-60 / 85", heroic = true, mythic = false, additionalInfo = L.TheDeadminesInfoText }
	dungeons.TheEmeraldNightmare = { id = 768, name = EJ_GetInstanceInfo(768), dungeonType = Type_Raid, level = "110", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.TheEmeraldNightmareInfoText }
	dungeons.TheEverbloom = { id = 556, name = EJ_GetInstanceInfo(556), dungeonType = Type_Dungeon, level = "100", heroic = true, mythic = true, additionalInfo = L.TheEverbloomInfoText }
	dungeons.TheEye = { id = 749, name = EJ_GetInstanceInfo(749), dungeonType = Type_Raid, level = "70", heroic = false, mythic = false, player = PLAYERS_25, additionalInfo = L.TheEyeInfoText }
	dungeons.TheEyeOfEternity = { id = 756, name = EJ_GetInstanceInfo(756), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TheEyeOfEternityInfoText }
	dungeons.TheForgeOfSouls = { id = 280, name = EJ_GetInstanceInfo(280), dungeonType = Type_Dungeon, level = "70-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheForgeOfSoulsInfoText }
	dungeons.TheHallsOfReflection = { id = 276, name = EJ_GetInstanceInfo(276), dungeonType = Type_Dungeon, level = "70-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheHallsOfReflectionInfoText }
	dungeons.TheMechanar = { id = 258, name = EJ_GetInstanceInfo(258), dungeonType = Type_Dungeon, level = "67-80", heroic = true, mythic = false, additionalInfo = L.TheMechanarInfoText }
	dungeons.TheNexus = { id = 281, name = EJ_GetInstanceInfo(281), dungeonType = Type_Dungeon, level = "59-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheNexusInfoText }
	dungeons.TheNighthold = { id = 786, name = EJ_GetInstanceInfo(786), dungeonType = Type_Raid, level = "110", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.TheNightholdInfoText }
	dungeons.TheOculus = { id = 282, name = EJ_GetInstanceInfo(282), dungeonType = Type_Dungeon, level = "67-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TheOculusInfoText }
	dungeons.TheObsidianSanctum = { id = 755, name = EJ_GetInstanceInfo(755), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TheObsidianSanctumInfoText }
	dungeons.TheRubySanctum = { id = 761, name = EJ_GetInstanceInfo(761), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TheRubySanctumInfoText }
	dungeons.TheSeatOfTheTriumvirate = { id = 945, name = EJ_GetInstanceInfo(945), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.TheSeatOfTheTriumvirateInfoText }
	dungeons.TheShatteredHalls = { id = 259, name = EJ_GetInstanceInfo(259), dungeonType = Type_Dungeon, level = "67-80", heroic = true, mythic = false, additionalInfo = L.TheShatteredHallsInfoText }
	dungeons.TheSlavePens = { id = 260, name = EJ_GetInstanceInfo(260), dungeonType = Type_Dungeon, level = "60-80", heroic = true, mythic = false, additionalInfo = L.TheSlavePensInfoText }
	dungeons.TheSteamvault = { id = 261, name = EJ_GetInstanceInfo(261), dungeonType = Type_Dungeon, level = "67-80", heroic = true, mythic = false, additionalInfo = L.TheSteamvaultInfoText }
	dungeons.TheStockade = { id = 238, name = EJ_GetInstanceInfo(238), dungeonType = Type_Dungeon, level = "20-60", heroic = false, mythic = false, additionalInfo = L.TheStockadeInfoText }
	dungeons.TheStonecore = { id = 67, name = EJ_GetInstanceInfo(67), dungeonType = Type_Dungeon, level = "81-90 / 85", heroic = true, mythic = false, additionalInfo = L.TheStonecoreInfoText }
	dungeons.TheTombOfSageras = { id = 875, name = EJ_GetInstanceInfo(875), dungeonType = Type_Raid, level = "110", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.TheTombOfSagerasInfoText }
	dungeons.TheUnderbog = { id = 262, name = EJ_GetInstanceInfo(262), dungeonType = Type_Dungeon, level = "61-80", heroic = true, mythic = false, additionalInfo = L.TheUnderbogInfoText }
	dungeons.TheVortexPinnacle = { id = 68, name = EJ_GetInstanceInfo(68), dungeonType = Type_Dungeon, level = "81-90 / 85", heroic = true, mythic = false, additionalInfo = L.TheVortexPinnacleInfoText }
	dungeons.ThroneOfTheFourWinds = { id = 74, name = EJ_GetInstanceInfo(74), dungeonType = Type_Raid, level = "85", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.ThroneOfTheFourWindsInfoText }
	dungeons.ThroneOfTheTides = { id = 65, name = EJ_GetInstanceInfo(65), dungeonType = Type_Dungeon, level = "80-90 / 85", heroic = true, mythic = false, additionalInfo = L.ThroneOfTheTidesInfoText }
	dungeons.ThroneOfThunder = { id = 362, name = EJ_GetInstanceInfo(362), dungeonType = Type_Raid, level = "90", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.ThroneOfThunderInfoText }
	dungeons.TrialOfTheChampion = { id = 284, name = EJ_GetInstanceInfo(284), dungeonType = Type_Dungeon, level = "68-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.TrialOfTheChampionInfoText }
	dungeons.TrialOfTheCrusader = { id = 757, name = EJ_GetInstanceInfo(757), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.TrialOfTheCrusaderInfoText }
	dungeons.TrialOfValor = { id = 861, name = EJ_GetInstanceInfo(861), dungeonType = Type_Raid, level = "110", heroic = true, mythic = true, player = PLAYERS_10_30, additionalInfo = L.TrialOfValorInfoText }
	dungeons.Uldaman = { id = 239, name = EJ_GetInstanceInfo(239), dungeonType = Type_Dungeon, level = "40-60", heroic = false, mythic = false, additionalInfo = L.UldamanInfoText }
	dungeons.UldamanBack = { id = 239, name = EJ_GetInstanceInfo(239) .. L.UldamanBack, dungeonType = Type_Dungeon, level = "40-60", heroic = false, mythic = false, additionalInfo = L.UldamanBackInfoText }
	dungeons.Ulduar = { id = 759, name = EJ_GetInstanceInfo(759), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.UlduarInfoText }
	dungeons.UpperBlackrockSpire = { id = 559, name = EJ_GetInstanceInfo(559), dungeonType = Type_Dungeon, level = "57-58 / 100", heroic = false, mythic = false, additionalInfo = L.UpperBlackrockSpireInfoText }
	dungeons.UtgardeKeep = { id = 285, name = EJ_GetInstanceInfo(285), dungeonType = Type_Dungeon, level = "58-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.UtgardeKeepInfoText }
	dungeons.UtgardePinnacle = { id = 286, name = EJ_GetInstanceInfo(286), dungeonType = Type_Dungeon, level = "67-80 / 80-82", heroic = true, mythic = false, additionalInfo = L.UtgardePinnacleInfoText }
	dungeons.VaultOfArchavon = { id = 753, name = EJ_GetInstanceInfo(753), dungeonType = Type_Raid, level = "80-83", heroic = true, mythic = false, player = PLAYERS_10_25, additionalInfo = L.VaultOfArchavonInfoText }
	dungeons.VaultOfTheWardens = { id = 707, name = EJ_GetInstanceInfo(707), dungeonType = Type_Dungeon, level = "110", heroic = true, mythic = true, additionalInfo = L.VaultOfTheWardensInfoText }
	dungeons.VioletHold = { id = 777, name = EJ_GetInstanceInfo(777), dungeonType = Type_Dungeon, level = "105-110", heroic = true, mythic = true, additionalInfo = L.VioletHoldInfoText }
	dungeons.TheVioletHold = { id = 283, name = EJ_GetInstanceInfo(283), dungeonType = Type_Dungeon, level = "75-77", heroic = true, mythic = false, additionalInfo = L.TheVioletHoldInfoText }
	dungeons.WailingCaverns = { id = 240, name = EJ_GetInstanceInfo(240), dungeonType = Type_Dungeon, level = "17-60", heroic = false, mythic = false, additionalInfo = L.WailingCavernsInfoText }
	dungeons.WellOfEternity = { id = 185, name = EJ_GetInstanceInfo(185), dungeonType = Type_Dungeon, level = "85", heroic = true, mythic = false, additionalInfo = L.WellOfEternityInfoText }
	dungeons.ZulAman = { id = 77, name = EJ_GetInstanceInfo(77), dungeonType = Type_Dungeon, level = "85", heroic = true, mythic = false, additionalInfo = L.ZulAmanInfoText }
	dungeons.ZulFarrak = { id = 241, name = EJ_GetInstanceInfo(241), dungeonType = Type_Dungeon, level = "44-60", heroic = false, mythic = false, additionalInfo = L.ZulFarrakInfoText }
	dungeons.ZulGurub = { id = 76, name = EJ_GetInstanceInfo(76), dungeonType = Type_Dungeon, level = "85", heroic = true, mythic = false, additionalInfo = L.ZulGurubInfoText }
end	

function initializeDungeonLocationMatrixWithId(id)
    dungeonLocations[id] = {}
end

function addDungeonLocation(id, x , y , dungeon)
    dungeonLocations[id][#dungeonLocations[id] + 1] = DLoc:CreateLocation(x, y, dungeon)
end

function initializeMatrixVanilla()
    initializeDungeonLocationMatrixWithId(areas.id_AhnQiraj)
    initializeDungeonLocationMatrixWithId(areas.id_Ashenvale)
    initializeDungeonLocationMatrixWithId(areas.id_Badlands)
    initializeDungeonLocationMatrixWithId(areas.id_BurningSteppes)
    initializeDungeonLocationMatrixWithId(areas.id_DeadwindPass)
    initializeDungeonLocationMatrixWithId(areas.id_Desolace)
    initializeDungeonLocationMatrixWithId(areas.id_DunMorogh)
    initializeDungeonLocationMatrixWithId(areas.id_DustwallowMarsh)
    initializeDungeonLocationMatrixWithId(areas.id_EasternPlaguelands)
    initializeDungeonLocationMatrixWithId(areas.id_Feralas)
    initializeDungeonLocationMatrixWithId(areas.id_NorthernBarrens)
    initializeDungeonLocationMatrixWithId(areas.id_NorthernStranglethorn)
    initializeDungeonLocationMatrixWithId(areas.id_Orgrimmar)
    initializeDungeonLocationMatrixWithId(areas.id_Silithus)
    initializeDungeonLocationMatrixWithId(areas.id_SilverpineForest)
	initializeDungeonLocationMatrixWithId(areas.id_SouthernBarrens)
    initializeDungeonLocationMatrixWithId(areas.id_Stormwind)
    initializeDungeonLocationMatrixWithId(areas.id_StranglethornVale)
    initializeDungeonLocationMatrixWithId(areas.id_SwampOfSorrows)
    initializeDungeonLocationMatrixWithId(areas.id_Tanaris)
    initializeDungeonLocationMatrixWithId(areas.id_ThousandNeedles)
    initializeDungeonLocationMatrixWithId(areas.id_TirisfalGlades)
    initializeDungeonLocationMatrixWithId(areas.id_WesternPlaguelands)
    initializeDungeonLocationMatrixWithId(areas.id_Westfall)
end

function initializeMatrixBC()
    initializeDungeonLocationMatrixWithId(areas.id_BladesEdgeMountains)
    initializeDungeonLocationMatrixWithId(areas.id_Ghostlands)
    initializeDungeonLocationMatrixWithId(areas.id_HellfirePeninsula)
    initializeDungeonLocationMatrixWithId(areas.id_IsleOfQuelDanas)
    initializeDungeonLocationMatrixWithId(areas.id_Netherstorm)
    initializeDungeonLocationMatrixWithId(areas.id_ShadowmoonValley)
    initializeDungeonLocationMatrixWithId(areas.id_TerokkarForest)
    initializeDungeonLocationMatrixWithId(areas.id_Zangarmarsh)
end

function initializeMatrixWotlK()
	initializeDungeonLocationMatrixWithId(areas.id_BoreanTundra)
	initializeDungeonLocationMatrixWithId(areas.id_CrystalsongForest)
    initializeDungeonLocationMatrixWithId(areas.id_Dragonblight)
    initializeDungeonLocationMatrixWithId(areas.id_Dalaran)
    initializeDungeonLocationMatrixWithId(areas.id_GrizzlyHills)
    initializeDungeonLocationMatrixWithId(areas.id_HowlingFjord)
    initializeDungeonLocationMatrixWithId(areas.id_Icecrown)
    initializeDungeonLocationMatrixWithId(areas.id_TheStormPeaks)
    initializeDungeonLocationMatrixWithId(areas.id_Wintergrasp)
    initializeDungeonLocationMatrixWithId(areas.id_ZulDrak)
end

function initializeMatrixCataclysm()
	initializeDungeonLocationMatrixWithId(areas.id_AbyssalDepth)
	initializeDungeonLocationMatrixWithId(areas.id_Deepholm)
	initializeDungeonLocationMatrixWithId(areas.id_MountHyjal)
	initializeDungeonLocationMatrixWithId(areas.id_TolBarad)
	initializeDungeonLocationMatrixWithId(areas.id_TwilightHighlands)
	initializeDungeonLocationMatrixWithId(areas.id_Uldum)
	initializeDungeonLocationMatrixWithId(areas.id_Vashjir)
end

function initializeMatrixPandaria()
    initializeDungeonLocationMatrixWithId(areas.id_DreadWastes)
    initializeDungeonLocationMatrixWithId(areas.id_IsleOfThunder)
    initializeDungeonLocationMatrixWithId(areas.id_KunLaiSummit)
    initializeDungeonLocationMatrixWithId(areas.id_TheJadeForest)
    initializeDungeonLocationMatrixWithId(areas.id_TheVeiledStair)
    initializeDungeonLocationMatrixWithId(areas.id_ValeOfEternalBlossom)
    initializeDungeonLocationMatrixWithId(areas.id_ValleyOfTheFourWinds)
    initializeDungeonLocationMatrixWithId(areas.id_TownlongSteppes)
end

function initializeMatrixWoD()
    initializeDungeonLocationMatrixWithId(areas.id_FrostfireRidge)
    initializeDungeonLocationMatrixWithId(areas.id_Gorgrond)
    initializeDungeonLocationMatrixWithId(areas.id_Nagrand)
    initializeDungeonLocationMatrixWithId(areas.id_ShadowmoonValley_WOD)
    initializeDungeonLocationMatrixWithId(areas.id_SpiresOfArak)
    initializeDungeonLocationMatrixWithId(areas.id_Talador)
    initializeDungeonLocationMatrixWithId(areas.id_TanaanJungle)
end

function initializeMatrixLegion()
	initializeDungeonLocationMatrixWithId(areas.id_DalaranLegion)
	initializeDungeonLocationMatrixWithId(areas.id_HighMountain)
	initializeDungeonLocationMatrixWithId(areas.id_Stormheim)
	initializeDungeonLocationMatrixWithId(areas.id_ValSharah)
	initializeDungeonLocationMatrixWithId(areas.id_Azsuna)
	initializeDungeonLocationMatrixWithId(areas.id_Suramar)
	initializeDungeonLocationMatrixWithId(areas.id_BrokenShore)
	initializeDungeonLocationMatrixWithId(areas.id_AntoranWastes)
	initializeDungeonLocationMatrixWithId(areas.id_MacAree)
end

function initializeDungeonLocationMatrix()
    initializeMatrixVanilla()
    initializeMatrixBC()
    initializeMatrixWotlK()
    initializeMatrixCataclysm()
    initializeMatrixPandaria()
	initializeMatrixWoD()
	initializeMatrixLegion()
end

function initializeDungeons()
    addDungeonLocation(areas.id_AbyssalDepth, 70.5, 30, dungeons.ThroneOfTheTides)
	addDungeonLocation(areas.id_Ashenvale, 14, 14, dungeons.BlackfathomDeeps)
    addDungeonLocation(areas.id_Badlands, 41.5, 11, dungeons.Uldaman)
    addDungeonLocation(areas.id_Badlands, 59, 37, dungeons.UldamanBack)
    addDungeonLocation(areas.id_BoreanTundra, 25, 20, dungeons.TheOculus)
	addDungeonLocation(areas.id_BoreanTundra, 28, 25, dungeons.TheNexus)
    addDungeonLocation(areas.id_BurningSteppes, 20, 36, dungeons.BlackrockDepths)
    addDungeonLocation(areas.id_BurningSteppes, 18, 27, dungeons.UpperBlackrockSpire)
    addDungeonLocation(areas.id_BurningSteppes, 22, 28, dungeons.LowerBlackrockSpire)
	addDungeonLocation(areas.id_BurningSteppes, 23, 34, dungeons.BlackrockCaverns)
	addDungeonLocation(areas.id_CrystalsongForest, 31, 39, dungeons.TheVioletHold)
	addDungeonLocation(areas.id_Dalaran, 67, 70, dungeons.TheVioletHold)
	addDungeonLocation(areas.id_DeadwindPass, 47, 70, dungeons.ReturnToKarazhan)
    addDungeonLocation(areas.id_Deepholm, 47, 50, dungeons.TheStonecore)
    addDungeonLocation(areas.id_Desolace, 30, 62, dungeons.Maraudon)
    addDungeonLocation(areas.id_Dragonblight, 25, 49, dungeons.AzjolNerub)
    addDungeonLocation(areas.id_Dragonblight, 28, 52, dungeons.AhnKahet)
    addDungeonLocation(areas.id_DunMorogh, 30, 37, dungeons.Gnomeregan)
    addDungeonLocation(areas.id_EasternPlaguelands, 27, 12, dungeons.Stratholme)
    addDungeonLocation(areas.id_EasternPlaguelands, 43, 19, dungeons.StratholmeBack)
    addDungeonLocation(areas.id_Feralas, 60, 31, dungeons.DireMaulWest)
    addDungeonLocation(areas.id_Feralas, 65, 30, dungeons.DireMaulEast)
    addDungeonLocation(areas.id_Feralas, 63, 25, dungeons.DireMaulNorth)
    addDungeonLocation(areas.id_FrostfireRidge, 51, 25, dungeons.BloodmaulSlagMines)
    addDungeonLocation(areas.id_Ghostlands, 76, 64, dungeons.ZulAman)
    addDungeonLocation(areas.id_Gorgrond, 45, 13.5, dungeons.IronDocks)
    addDungeonLocation(areas.id_Gorgrond, 60, 45, dungeons.TheEverbloom)
    addDungeonLocation(areas.id_Gorgrond, 55, 32, dungeons.GrimrailDepot)
    addDungeonLocation(areas.id_GrizzlyHills, 18, 25, dungeons.DrakTharonKeep)
    addDungeonLocation(areas.id_HellfirePeninsula, 48, 54, dungeons.HellfireRamparts)
    addDungeonLocation(areas.id_HellfirePeninsula, 46, 52, dungeons.TheBloodFurnace)
	addDungeonLocation(areas.id_HellfirePeninsula, 48, 52, dungeons.TheShatteredHalls)
    addDungeonLocation(areas.id_HowlingFjord, 58, 51, dungeons.UtgardeKeep)
    addDungeonLocation(areas.id_HowlingFjord, 57, 48, dungeons.UtgardePinnacle)
    addDungeonLocation(areas.id_Icecrown, 73, 21, dungeons.TrialOfTheChampion)
    addDungeonLocation(areas.id_Icecrown, 52, 88.5, dungeons.TheForgeOfSouls)
    addDungeonLocation(areas.id_Icecrown, 49, 87, dungeons.PitOfSaron)
    addDungeonLocation(areas.id_Icecrown, 51, 85, dungeons.TheHallsOfReflection)
    addDungeonLocation(areas.id_IsleOfQuelDanas, 61, 31, dungeons.MagistersTerrace)
	addDungeonLocation(areas.id_KunLaiSummit, 30, 40, dungeons.ShadoPanMonastery)
    addDungeonLocation(areas.id_Netherstorm, 74, 57, dungeons.TheArcatraz)
    addDungeonLocation(areas.id_Netherstorm, 72, 55, dungeons.TheBotanica)
    addDungeonLocation(areas.id_Netherstorm, 70, 70, dungeons.TheMechanar)
    addDungeonLocation(areas.id_NorthernBarrens, 39, 69, dungeons.WailingCaverns)
    addDungeonLocation(areas.id_NorthernStranglethorn, 72, 33, dungeons.ZulGurub )
    addDungeonLocation(areas.id_Orgrimmar, 55, 58, dungeons.RagefireChasm)
    addDungeonLocation(areas.id_ShadowmoonValley_WOD, 32, 42.5, dungeons.ShadowmoonBurialGrounds)
    addDungeonLocation(areas.id_SilverpineForest, 45.5, 68, dungeons.ShadowfangKeep)
	addDungeonLocation(areas.id_SouthernBarrens, 41, 95, dungeons.RazorfenKraul)
	addDungeonLocation(areas.id_SpiresOfArak, 35.5, 33.5, dungeons.Skyreach)
	addDungeonLocation(areas.id_Stormwind, 51, 67, dungeons.TheStockade)
	addDungeonLocation(areas.id_StranglethornVale, 63.5, 22, dungeons.ZulGurub)
    addDungeonLocation(areas.id_SwampOfSorrows, 69, 54, dungeons.SunkenTempel)
    addDungeonLocation(areas.id_Talador, 45, 74.5, dungeons.Auchindoun)
    addDungeonLocation(areas.id_Tanaris, 40, 22, dungeons.ZulFarrak)
    addDungeonLocation(areas.id_Tanaris, 64, 51, dungeons.TheBlackMorass)
    addDungeonLocation(areas.id_Tanaris, 62, 48, dungeons.WellOfEternity)
    addDungeonLocation(areas.id_Tanaris, 64, 45, dungeons.EscapeFromDurnholde)
    addDungeonLocation(areas.id_Tanaris, 69, 45, dungeons.EndTime)
    addDungeonLocation(areas.id_Tanaris, 70.5, 48, dungeons.HourOfTwilight)
    addDungeonLocation(areas.id_Tanaris, 68, 51, dungeons.TheCullingOfStratholme)
    addDungeonLocation(areas.id_TerokkarForest, 39.5, 59, dungeons.ManaTombs)
    addDungeonLocation(areas.id_TerokkarForest, 35.5, 65.5, dungeons.AuchenaiCrypts)
    addDungeonLocation(areas.id_TerokkarForest, 44, 65.5, dungeons.SethekkHalls)
	addDungeonLocation(areas.id_TerokkarForest, 39.5, 72, dungeons.ShadowLabyrinth)
	addDungeonLocation(areas.id_TheJadeForest, 55, 55, dungeons.TempleOfTheJadeSerpent)
    addDungeonLocation(areas.id_TheStormPeaks, 38, 15, dungeons.HallsOfStone)
	addDungeonLocation(areas.id_TheStormPeaks, 45, 14.5, dungeons.HallsOfLightning)
    addDungeonLocation(areas.id_ThousandNeedles, 47, 23, dungeons.RazorfenDowns)
    addDungeonLocation(areas.id_TirisfalGlades, 85, 28, dungeons.ScarletHalls)
    addDungeonLocation(areas.id_TirisfalGlades, 88, 31, dungeons.ScarletMonastery)
    addDungeonLocation(areas.id_TownlongSteppes, 30, 80, dungeons.SiegeOfNiuzaoTemple)
    addDungeonLocation(areas.id_TwilightHighlands, 19, 53.5, dungeons.GrimBatol)
    addDungeonLocation(areas.id_Uldum, 77, 84, dungeons.TheVortexPinnacle)
    addDungeonLocation(areas.id_Uldum, 61, 64, dungeons.LostCityOfTheTolvir)
    addDungeonLocation(areas.id_Uldum, 69, 53, dungeons.HallsOfOrigination)
    addDungeonLocation(areas.id_ValeOfEternalBlossom, 15, 80, dungeons.GateOfTheSettingSun)
    addDungeonLocation(areas.id_ValeOfEternalBlossom, 79, 35, dungeons.MogushanPalace)
	addDungeonLocation(areas.id_ValleyOfTheFourWinds, 36, 69, dungeons.StormstoutBrewery)
    addDungeonLocation(areas.id_Vashjir, 48.5, 42, dungeons.ThroneOfTheTides)
    addDungeonLocation(areas.id_WesternPlaguelands, 70, 75, dungeons.Scholomance)
    addDungeonLocation(areas.id_Westfall, 43, 72, dungeons.TheDeadmines)
    addDungeonLocation(areas.id_Zangarmarsh, 47, 42, dungeons.TheSlavePens)
    addDungeonLocation(areas.id_Zangarmarsh, 48, 39, dungeons.TheSteamvault)
    addDungeonLocation(areas.id_Zangarmarsh, 53, 42, dungeons.TheUnderbog)
    addDungeonLocation(areas.id_ZulDrak, 28, 89, dungeons.DrakTharonKeep)
    addDungeonLocation(areas.id_ZulDrak, 77, 21, dungeons.Gundrak)
    addDungeonLocation(areas.id_ZulDrak, 81, 29, dungeons.Gundrak)
end

function initializeLegionDungeons() 
	addDungeonLocation(areas.id_Azsuna, 61, 41, dungeons.EyeOfAzshara)
	addDungeonLocation(areas.id_Azsuna, 48, 82, dungeons.VaultOfTheWardens)
	addDungeonLocation(areas.id_BrokenShore, 64.7, 16.7, dungeons.CathedralOfEternalNight)
	addDungeonLocation(areas.id_HighMountain, 49.5, 68.5, dungeons.NeltharionsLair)
	addDungeonLocation(areas.id_MacAree, 22.2, 56.7, dungeons.TheSeatOfTheTriumvirate)
	addDungeonLocation(areas.id_Stormheim, 52.5, 45.5, dungeons.MawOfSouls)
	addDungeonLocation(areas.id_Stormheim, 72.5, 70.5, dungeons.HallsOfValor)
	addDungeonLocation(areas.id_DalaranLegion, 68, 69, dungeons.VioletHold)
	addDungeonLocation(areas.id_Suramar, 41, 61.5, dungeons.TheArcway)
	addDungeonLocation(areas.id_Suramar, 50.7, 65.5, dungeons.CourtOfStars)
	addDungeonLocation(areas.id_ValSharah, 59, 31.5, dungeons.DarkheartThicket)
	addDungeonLocation(areas.id_ValSharah, 37, 50.5, dungeons.BlackRookHold)
end

function initializeRaids()
    addDungeonLocation(areas.id_AhnQiraj, 59, 14, dungeons.RuinsOfAhnQiraj)
	addDungeonLocation(areas.id_AhnQiraj, 47, 7.5, dungeons.TempleOfAhnQiraj)
    addDungeonLocation(areas.id_BladesEdgeMountains, 68, 23, dungeons.GruulsLair)
	addDungeonLocation(areas.id_BoreanTundra, 27.7, 21, dungeons.TheEyeOfEternity)
    addDungeonLocation(areas.id_BurningSteppes, 20, 33, dungeons.MoltenCore)
    addDungeonLocation(areas.id_BurningSteppes, 20, 30, dungeons.BlackwingLair)
    addDungeonLocation(areas.id_BurningSteppes, 17, 32, dungeons.BlackwingDescent)
    addDungeonLocation(areas.id_DeadwindPass, 47, 75, dungeons.Karazhan)
    addDungeonLocation(areas.id_Dragonblight, 60, 57, dungeons.TheObsidianSanctum)
    addDungeonLocation(areas.id_Dragonblight, 62, 56, dungeons.TheRubySanctum)
    addDungeonLocation(areas.id_Dragonblight, 87.5, 46.5, dungeons.Naxxramas)
    addDungeonLocation(areas.id_DreadWastes, 39, 35, dungeons.HeartOfFear)
    addDungeonLocation(areas.id_DustwallowMarsh, 52, 77, dungeons.OnyxiasLair)
    addDungeonLocation(areas.id_Gorgrond, 51.5, 29, dungeons.BlackrockFoundry)
    addDungeonLocation(areas.id_HellfirePeninsula, 45, 55, dungeons.MagtheridonsLair)
    addDungeonLocation(areas.id_Icecrown, 75, 23, dungeons.TrialOfTheCrusader)
    addDungeonLocation(areas.id_Icecrown, 54, 84, dungeons.IcecrownCitadel )
    addDungeonLocation(areas.id_IsleOfQuelDanas, 44, 45, dungeons.SunwellPlateau)
    addDungeonLocation(areas.id_IsleOfThunder, 64, 32, dungeons.ThroneOfThunder)
    addDungeonLocation(areas.id_KunLaiSummit, 60, 38, dungeons.MogushanVaults)
    addDungeonLocation(areas.id_MountHyjal, 47, 78, dungeons.Firelands)
    addDungeonLocation(areas.id_Netherstorm, 73, 63, dungeons.TheEye)
    addDungeonLocation(areas.id_Nagrand, 34, 38, dungeons.Highmaul)
    addDungeonLocation(areas.id_ShadowmoonValley, 71, 46, dungeons.TheBlackTemple)
    addDungeonLocation(areas.id_Silithus, 36, 84, dungeons.RuinsOfAhnQiraj)
	addDungeonLocation(areas.id_Silithus, 24, 87, dungeons.TempleOfAhnQiraj)
    addDungeonLocation(areas.id_TanaanJungle, 45, 54, dungeons.HellfireCitadel)
    addDungeonLocation(areas.id_Tanaris, 66, 44, dungeons.TheBattleForMountHyjal)
    addDungeonLocation(areas.id_Tanaris, 71, 45, dungeons.Dragonsoul)
    addDungeonLocation(areas.id_TheStormPeaks, 41.5, 16, dungeons.Ulduar)
    addDungeonLocation(areas.id_TheVeiledStair, 50, 60, dungeons.TerraceOfEndlessSpring)
    addDungeonLocation(areas.id_TolBarad, 51, 50, dungeons.BaradinHold)
    addDungeonLocation(areas.id_TwilightHighlands, 34, 78, dungeons.TheBastionOfTwilight)
    addDungeonLocation(areas.id_Uldum, 39, 81, dungeons.ThroneOfTheFourWinds)
	addDungeonLocation(areas.id_ValeOfEternalBlossom, 74, 42, dungeons.SiegeOfOrgrimmar)
    addDungeonLocation(areas.id_Wintergrasp, 50, 18, dungeons.VaultOfArchavon)
    addDungeonLocation(areas.id_Zangarmarsh, 51, 38, dungeons.SerpentshrineCavern)
end

function initializeLegionRaids()
	addDungeonLocation(areas.id_AntoranWastes, 54.7, 62.5, dungeons.AntorusTheBurningThrone)
	addDungeonLocation(areas.id_BrokenShore, 64, 21.5, dungeons.TheTombOfSageras)
	addDungeonLocation(areas.id_Stormheim, 71.1, 73, dungeons.TrialOfValor)
	addDungeonLocation(areas.id_Suramar, 43.7, 57.3, dungeons.TheNighthold)
	addDungeonLocation(areas.id_ValSharah, 56.5, 37.5, dungeons.TheEmeraldNightmare)
end

function DLoc:hasId(id)
    if(dungeonLocations[id] ~= nil) then
        return true
    else
        return false
    end
end

function DLoc:getDungeonLocations()
	return dungeonLocations
end

function DLoc:getDungeons()
	return dungeons
end

function DLoc:getAreas()
	return areas
end

function DLoc:DetermineAreaIdForSpecialMapAreas(worldMapId)
	if(GetCurrentMapDungeonLevel() > 0) then
		return nil
	end
	--if(worldMapId == areas.id_Tanaris) then
	-- if(worldMapId == areas.id_TheVeiledStair) then
	-- if(worldMapId == areas.id_Westfall) then
	-- if(worldMapId == areas.id_Azsuna) then
	return worldMapId
end

function DLoc:CreateLocations()
	local configuration = DLoc:GetConfiguration() 

	areas = {}
 	dungeons = {}
	dungeonLocations = {}
	 
	setupAreaData()
	setupDungeonData()
	initializeDungeonLocationMatrix()
	initializeDungeons()
	initializeRaids()
	if(configuration.showLegionDungeonLocations) then
		initializeLegionDungeons()
		initializeLegionRaids()
	end
 end