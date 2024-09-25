#Requires AutoHotkey v2.0-beta


showBerriesGUI(*) {
    allBerriesText := TextFieldProps("OOPS! All (food) Berries!")
    confirmText := TextFieldProps("Confirm")
    backText := TextFieldProps("Back")


    BerriesMenu := Gui()
    BerriesMenu.Title := "Berries to keep"
    BerriesMenu.BackColor := guiOptions.backgroundColor
    BerriesMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)
    BerriesMenu.AddText(, "Which berry are you gathering?")

    csapGuiCtrl := BerriesMenu.AddCheckBox(, "Cactus Sap")
    seedGuiCtrl := BerriesMenu.AddCheckBox(, "Seeds")
    stimGuiCtrl := BerriesMenu.AddCheckBox(, "Stimberries")
    narcGuiCtrl := BerriesMenu.AddCheckBox(, "Narcoberries")
    mejoGuiCtrl := BerriesMenu.AddCheckBox(, "Mejoberries")
    tintGuiCtrl := BerriesMenu.AddCheckBox(, "Tintoberries")
    azulGuiCtrl := BerriesMenu.AddCheckBox(, "Azulerries")
    amarGuiCtrl := BerriesMenu.AddCheckBox(, "Amarberries")
    
    BerriesMenu.AddText(allBerriesText.buttonOptions, allBerriesText.text).OnEvent("Click", foodBerriesButton)
    BerriesMenu.AddText(confirmText.buttonOptions, confirmText.text).OnEvent("Click", berryConfirmButton)
    BerriesMenu.AddText(backText.buttonOptions guiOptions.nextInLine, backText.text).OnEvent("Click", backButton)
    BerriesMenu.Show




    foodBerriesButton(*) {
        global foodBerries := true
        BerriesMenu.Destroy()
    }

    berryConfirmButton(*) {
        global csap
        global seeds
        global stimberrry
        global narcoberry
        global mejoberry
        global tintoberry
        global azulberry
        global amarberry
        global foodBerries
        
        csap := csapGuiCtrl.Value
        seeds := seedGuiCtrl.Value
        stimberrry := stimGuiCtrl.Value
        narcoberry := narcGuiCtrl.Value
        mejoberry := mejoGuiCtrl.Value
        tintoberry := tintGuiCtrl.Value
        azulberry := azulGuiCtrl.Value
        amarberry := amarGuiCtrl.Value
        foodBerries := false
        BerriesMenu.Destroy()
    }

    backButton(*){
        showOptionsGUI()
        BerriesMenu.Destroy()
    }
}