#Requires AutoHotkey v2.0-beta

;;;;;Window Names;;;;;
ASE_WIN_EXE := "ahk_exe ShooterGame.exe"
ASA_WIN_EXE := "ahk_exe ArkAscended.exe"

;;;;;Modes;;;;;
STANDARD_MODE := 0
NO_MACROS_MODE := 1
MASS_CRAFTING_MODE := 2
BERRY_MODE := 3
CROP_MODE := 4
COORDS_PICKER_MODE := 5
BABY_FEEDER_MODE := 6
global macroMode := STANDARD_MODE

;;;;;Berries;;;;;
global csap := 0
global seeds := 0
global stimberrry := 0
global narcoberry := 0
global mejoberry := 0
global tintoberry := 0
global azulberry := 0
global amarberry := 0
global foodBerries := 0

;;;;;Coords;;;;;
global xCoords := 0
global yCoords := 0
global coordsClicked := false

babyFeederOn := false
