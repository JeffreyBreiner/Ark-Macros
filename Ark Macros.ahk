#Requires AutoHotkey v2.0

#Include Global Variables.ahk
#Include iniManage.ahk
#Include Quick Actions.ahk

;Modes
#Include Modes\Standard Mode.ahk
#Include Modes\Mass Crafting Mode.ahk
#Include Modes\Berry Mode.ahk
#Include Modes\Crop Mode.ahk
#Include Modes\Coords Picker Mode.ahk

;GUIs
#Include GUIs\Options GUI.ahk
#Include GUIs\Berry GUI.ahk
#Include GUIs\Baby Feeder GUI.ahk
#Include GUIs\Settings GUI.ahk
#Include GUIs\Calibration GUI.ahk
#Include GUIs\Macro Keybinds GUI.ahk
#Include GUIs\Ingame Keybinds GUI.ahk
#Include GUIs\GUI Properties.ahk

tray := A_TrayMenu
tray.Delete("&Open")
tray.Delete("&Help")
tray.Delete("&Edit Script")
tray.Insert("E&xit", "S&how Options", MenuHandler)

MenuHandler(ItemName := "testItem1", ItemPos := 1, MyMenu := 0) {
    showOptionsGUI()
}


;;;;;All the hotkeys;;;;;

;   Instructions for changing the keybinds:
;   Everything to the left of the '::' is the keybind
;   + means shift
;   ^ means ctrl
;   ! means alt
;   # means the windows key
;   examples:
;   +2 means holding down shift and pressing the 2 key (note: this refers to the number keys above your letter keys, not the numpad)
;   +Numpad2 means holding down shift and pressing the 2 key on the numpad
;   2 means just hitting the 2 key regardless of any other keys that are being pressed
;   ^a means ctrl + a
;   see this link for more details: https://www.autohotkey.com/docs/v2/Hotkeys.htm

#HotIf WinActive(ASE_WIN_EXE) || WinActive(ASA_WIN_EXE)
+`:: showOptionsGUI()

#HotIf macroMode = COORDS_PICKER_MODE

LButton:: global coordsClicked := true

#HotIf macroMode != NO_MACROS_MODE && macroMode != COORDS_PICKER_MODE && (WinActive(ASE_WIN_EXE) || WinActive(ASA_WIN_EXE))
+4:: depositAllAndClose()

+5:: takeAllAndClose()

+6:: depositRawMeat()

+7:: depositAllBerries()

+8:: depositKibble()

#HotIf macroMode = MASS_CRAFTING_MODE && (WinActive(ASE_WIN_EXE) || WinActive(ASA_WIN_EXE))
+1:: massCraft("kp")        ;sparkpowder

+2:: massCraft("np")        ;gunpowder

+3:: massCraft("cs")        ;electronics

+0:: massCraft("ed ri")     ;ARB

#HotIf macroMode = BERRY_MODE && (WinActive(ASE_WIN_EXE) || WinActive(ASA_WIN_EXE))
+1:: filterBerries()

+2:: dropUnwantedBerries()

;+3:: dropAllFromDedi()

#HotIf macroMode = CROP_MODE && (WinActive(ASE_WIN_EXE) || WinActive(ASA_WIN_EXE))
+1:: harvestCrops()

#HotIf