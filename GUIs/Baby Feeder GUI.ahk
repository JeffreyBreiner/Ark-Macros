#Requires AutoHotkey v2.0


showBabyFeederGUI(){
    instructionsText := TextFieldProps( "Welcome to the Baby Dino Feeder.`n"
                                        "This will keep your baby dino fed for you.`n"
                                        "A few important things to note:`n"
                                        "- This only works on one dino at a time`n"
                                        "    - This is because it would not be possible to`n"
                                        "      accurately walk to the next dino automatically`n"
                                        "- You must have food in your inventory for the baby`n"
                                        "- Place food and drink on your 8 and 9 keys and the script will keep you alive`n"
                                        "    - Accidents still happen, so don't just AFK with expensive stuff on you`n"
                                        "- Have the Dino's inventory open when you begin`n"
                                        "- Press the `"Start`" button to start, open the Options menu to stop")

    whatFoodText := TextFieldProps("What Food?")
    rawMeatText := TextFieldProps("Raw Red/Fish Meat")
    berriesText := TextFieldProps("Berries")
    kibbleText := TextFieldProps("Kibble")
    customFoodText := TextFieldProps("Custom (specify search term)")

    startText := TextFieldProps("Start")
    backText := TextFieldProps("Back")


    babyFeederMenu := Gui()
    babyFeederMenu.Title := "Options"
    babyFeederMenu.BackColor := guiOptions.backgroundColor
    babyFeederMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)

    babyFeederMenu.AddText(, instructionsText.text)
    
    babyFeederMenu.AddText(, whatFoodText.text)
    babyFeederMenu.AddRadio(, rawMeatText.text)
    babyFeederMenu.AddRadio(, berriesText.text)
    babyFeederMenu.AddRadio(, kibbleText.text)
    babyFeederMenu.AddRadio(, customFoodText.text)
    customFood := babyFeederMenu.AddEdit(guiOptions.inlineEditBox " w400")

    babyFeederMenu.AddText("Hidden", "")
    babyFeederMenu.AddText(startText.buttonOptions, startText.text).OnEvent("Click", startButton)
    babyFeederMenu.AddText(backText.buttonOptions guiOptions.nextInLine, backText.text).OnEvent("Click", backButton)
    babyFeederMenu.Show

    startButton(*) {
        MsgBox("Sorry, this feature is currently under development.`nCome back later.")
/*
        global babyFeederOn := true
        macroMode := BABY_FEEDER_MODE

        while(babyFeederOn){
            
        }
        */
        showOptionsGUI()
        babyFeederMenu.Destroy()
    }

    backButton(*) {
        showOptionsGUI()
        babyFeederMenu.Destroy()
    }
}