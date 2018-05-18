@echo off

set /p release="Enter Release: "

:: Delete old build folder with all contents (/S), silently (/Q)
rd DungeonLocations /S /Q

:: Re-Create folder
md DungeonLocations

:: Copy Files over 
xcopy Art\*.tga DungeonLocations\Art /i
xcopy Localization\*.lua DungeonLocations\Localization /i
xcopy *.lua DungeonLocations
xcopy *.toc DungeonLocations
xcopy License.url DungeonLocations

"C:\Program Files\7-Zip\7z.exe" a -tzip DungeonLocations-%release%.zip DungeonLocations 

pause