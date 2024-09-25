#Requires AutoHotkey v2.0-beta


showOptionsGUI(*) {
    massCraftingText := TextFieldProps("Mass Crafting")
    berryText := TextFieldProps("Berry Gathering")
    cropText := TextFieldProps("Crop Gathering")
    standardModeText := TextFieldProps("Standard Mode")
    babyFeederText := TextFieldProps("Baby Dino Feeder Mode")
    noMacrosText := TextFieldProps("No Macros")
    settingsText := TextFieldProps("Settings")
    closeText := TextFieldProps("Close")


    optionsMenu := Gui()
    optionsMenu.Title := "Options"
    optionsMenu.BackColor := guiOptions.backgroundColor
    optionsMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)

    optionsMenu.AddText(massCraftingText.buttonOptions, massCraftingText.text).OnEvent("Click", masssCraftingButton)
    optionsMenu.AddText(berryText.buttonOptions,        berryText.text       ).OnEvent("Click", berryButton)
    optionsMenu.AddText(cropText.buttonOptions,         cropText.text        ).OnEvent("Click", cropButton)
    optionsMenu.AddText(standardModeText.buttonOptions, standardModeText.text).OnEvent("Click", standardButton)
    optionsMenu.AddText(babyFeederText.buttonOptions,   babyFeederText.text  ).OnEvent("Click", babyFeederButton)
    optionsMenu.AddText(noMacrosText.buttonOptions,     noMacrosText.text    ).OnEvent("Click", noMacrosButton)
    optionsMenu.AddText(settingsText.buttonOptions,     settingsText.text    ).OnEvent("Click", settingsMenuButton)
    optionsMenu.AddText(closeText.buttonOptions,        closeText.text       ).OnEvent("Click", closeButton)
    optionsMenu.Show
    global babyFeederOn := false
    if(macroMode == BABY_FEEDER_MODE){
        global macroMode := STANDARD_MODE
    }

    masssCraftingButton(*) {
        global macroMode := MASS_CRAFTING_MODE
        global submittedVars := optionsMenu.Submit()
        ;global implant := submittedVars.Implant
        optionsMenu.Destroy()
    }

    berryButton(*) {
        global macroMode := BERRY_MODE
        showBerriesGUI()
        optionsMenu.Destroy()
    }

    cropButton(*) {
        global macroMode := CROP_MODE
        optionsMenu.Destroy()
    }

    standardButton(*) {
        global macroMode := STANDARD_MODE
        optionsMenu.Destroy()
    }

    babyFeederButton(*){
        showBabyFeederGUI()
        optionsMenu.Destroy()
    }

    noMacrosButton(*) {
        global macroMode := NO_MACROS_MODE
        optionsMenu.Destroy()
    }

    settingsMenuButton(*) {
        showSettingsGUI()
        optionsMenu.Destroy()
    }

    closeButton(*){
        optionsMenu.Destroy()
    }
}