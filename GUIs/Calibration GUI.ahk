#Requires AutoHotkey v2.0-beta



showCalibrationGUI(*) {
    gameIniBool := 999
    gameIniStr := 999

    searchSelf := Map()
    depositAll := Map()
    dropAllSelf := Map()
    searchRemote := Map()
    takeAll := Map()
    dropAllRemote := Map()
    
    coordMapList := [searchSelf, depositAll, dropAllSelf, searchRemote, takeAll, dropAllRemote]
    pointerImgLocation := "Resources\Pointer.png"

    initializeVars()

    ;;;;;Text Field Strings;;;;;
    xText := TextFieldProps("X:")
    yText := TextFieldProps("Y:")
    saveExitText := TextFieldProps("Save and Exit")
    backText := TextFieldProps("Back")
    closeText := TextFieldProps("Close")

    ;;;;;Tab Name Strings;;;;;
    yourInventory := "Your Inventory"
    remoteInventory := "Remote Inventory"
    
    ;;;;;GUI Boiler Plate;;;;;
    calibrationMenu := Gui()
    calibrationMenu.Title := "Coordinates Calibration"
    calibrationMenu.BackColor := guiOptions.backgroundColor
    calibrationMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)

    ;;;;;Radio and Tabs;;;;;
    ASERadio := calibrationMenu.AddRadio("Checked" gameIniBool, "ASE")
    ASARadio := calibrationMenu.AddRadio(guiOptions.nextInLine " Checked" (!gameIniBool), "ASA")
    ASERadio.OnEvent("Click", switchGames)
    ASARadio.OnEvent("Click", switchGames)
    tabControl := calibrationMenu.AddTab3(guiOptions.newRow " w301 h260 Border", [yourInventory, remoteInventory])

    ;;;;;Bottom Buttons;;;;;
    tabControl.UseTab(0)
    calibrationMenu.AddText(saveExitText.buttonOptions guiOptions.newRow, saveExitText.text).OnEvent("Click", saveExitButton)
    calibrationMenu.AddText(backText.buttonOptions guiOptions.nextInLine, backText.text).OnEvent("Click", backButton)
    calibrationMenu.AddText(closeText.buttonOptions guiOptions.nextInLine, closeText.text).OnEvent("Click", closeButton)

    ;;;;;Your Inventory Tab;;;;;
    tabControl.UseTab(yourInventory)
    calibrationMenu.AddGroupBox(guiOptions.coordsGroupBoxSize, "Searchbar")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    searchSelf["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, searchSelf[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text)
    searchSelf["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, searchSelf[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,searchSelf["GUIX"], searchSelf["GUIY"], "your `ncharacter's Searchbar"))

    calibrationMenu.AddGroupBox(guiOptions.nextGroupBox guiOptions.coordsGroupBoxSize, "Tranfer All Button")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    depositAll["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, depositAll[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text) 
    depositAll["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, depositAll[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,depositAll["GUIX"], depositAll["GUIY"], "your `ncharacter's `"Transfer All`" button"))

    calibrationMenu.AddGroupBox(guiOptions.nextGroupBox guiOptions.coordsGroupBoxSize, "Drop All Button")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    dropAllSelf["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, dropAllSelf[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text) 
    dropAllSelf["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, dropAllSelf[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,dropAllSelf["GUIX"], dropAllSelf["GUIY"], "your `ncharacter's `"Drop All`" button"))

    ;;;;;Remote Inventory Tab;;;;;
    tabControl.UseTab(remoteInventory)
    calibrationMenu.AddGroupBox(guiOptions.coordsGroupBoxSize, "Searchbar")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    searchRemote["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, searchRemote[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text) 
    searchRemote["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, searchRemote[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,searchRemote["GUIX"], searchRemote["GUIY"], "the `nremote inventory's Searchbar"))

    calibrationMenu.AddGroupBox(guiOptions.nextGroupBox guiOptions.coordsGroupBoxSize, "Tranfer All Button")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    takeAll["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, takeAll[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text) 
    takeAll["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, takeAll[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,takeAll["GUIX"], takeAll["GUIY"], "the `nremote inventory's `"Transfer All`" button"))

    calibrationMenu.AddGroupBox(guiOptions.nextGroupBox guiOptions.coordsGroupBoxSize, "Drop All Button")
    calibrationMenu.AddText(guiOptions.firstInsideGroupBox, xText.text)
    dropAllRemote["GUIX"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, dropAllRemote[gameIniStr "X"])
    calibrationMenu.AddText(guiOptions.afterEditBox, yText.text) 
    dropAllRemote["GUIY"] := calibrationMenu.AddEdit(guiOptions.inlineEditBox, dropAllRemote[gameIniStr "Y"])
    calibrationMenu.AddPicture(guiOptions.nextInLine, pointerImgLocation)
        .OnEvent("Click", pickCoordsButton.Bind(,,dropAllRemote["GUIX"], dropAllRemote["GUIY"], "the `nremote inventory's `"Drop All`" button"))

    ;;;;;Prevents First Edit Box From Grabbing Focus;;;;;
    calibrationMenu.AddButton("VDefault W0 H0 Default ")
    calibrationMenu["Default"].Focus()

    calibrationMenu.Show


    initializeVars(){
        if(WinExist(ASE_WIN_EXE)){
            gameIniBool := true
            gameIniStr := "ASE"
        }else{
            gameIniBool := false
            gameIniStr := "ASA"
        }

        searchSelf["ASEX"] := ASESearchSelfX
        searchSelf["ASAX"] := ASASearchSelfX
        searchSelf["ASEY"] := ASESearchSelfY
        searchSelf["ASAY"] := ASASearchSelfY
            
        depositAll["ASEX"] := ASEDepositAllX
        depositAll["ASAX"] := ASADepositAllX
        depositAll["ASEY"] := ASEDepositAllY
        depositAll["ASAY"] := ASADepositAllY
        
        dropAllSelf["ASEX"] := ASEDropAllSelfX
        dropAllSelf["ASAX"] := ASADropAllSelfX
        dropAllSelf["ASEY"] := ASEDropAllSelfY
        dropAllSelf["ASAY"] := ASADropAllSelfY
        
        searchRemote["ASEX"] := ASESearchRemoteX
        searchRemote["ASAX"] := ASASearchRemoteX
        searchRemote["ASEY"] := ASESearchRemoteY
        searchRemote["ASAY"] := ASASearchRemoteY
        
        takeAll["ASEX"] := ASETakeAllX
        takeAll["ASAX"] := ASATakeAllX
        takeAll["ASEY"] := ASETakeAllY
        takeAll["ASAY"] := ASATakeAllY
        
        dropAllRemote["ASEX"] := ASEDropAllRemoteX
        dropAllRemote["ASAX"] := ASADropAllRemoteX
        dropAllRemote["ASEY"] := ASEDropAllRemoteY
        dropAllRemote["ASAY"] := ASADropAllRemoteY
    }

    switchGames(*){
        if(gameIniBool){
            saveGUIToStorage("ASE")
        }else{
            saveGUIToStorage("ASA")
        }
        if(ASERadio.Value){
            gameIniBool := true
            saveStorageToGUI("ASE")
        }
        if(ASARadio.Value){
            gameIniBool := false
            saveStorageToGUI("ASA")
        }
    }

    saveGUIToStorage(gameStr){
        for coordMap in coordMapList{
            coordMap[gameStr "X"] := coordMap["GUIX"].Value
            coordMap[gameStr "Y"] := coordMap["GUIY"].Value
        }
    }

    saveStorageToGUI(gameStr){
        for coordMap in coordMapList{
            coordMap["GUIX"].Value := coordMap[gameStr "X"]
            coordMap["GUIY"].Value := coordMap[gameStr "Y"]
        }
    }

    pickCoordsButton(hCtrl, Info, xpos, ypos, toolTipText){
        if(ASERadio.Value && WinExist(ASE_WIN_EXE)){
            WinActivate(ASA_WIN_EXE)
        }else if(ASARadio.Value && WinExist(ASA_WIN_EXE)){
            WinActivate(ASA_WIN_EXE)
        }else{
            MsgBox("Error: Ark Window Not Found")
            return
        }

        macroModeTemp := macroMode
        global macroMode := COORDS_PICKER_MODE
        global coordsClicked := false
        while (!coordsClicked){
            ToolTip("Please LEFT-CLICK on " toolTipText)
            Sleep(10)
        }
        ToolTip()
        global macroMode := macroModeTemp

        if(!((ASERadio.Value && WinActive(ASE_WIN_EXE)) || (ASARadio.Value && WinActive(ASA_WIN_EXE)))){
            MsgBox("Error: Please make sure you click somewhere on the Ark window")
            return
        }
        pickCoords(&xPicked, &yPicked)

        if(!WinExist(calibrationMenu.Title)){
            MsgBox("Error: Calibration Menu has been closed.")
            return
        }
        xpos.Value := xPicked
        ypos.Value := yPicked
        WinActivate(calibrationMenu.Title)
    }

    saveExitButton(*){
        if(ASERadio.Value){
            saveGUIToStorage("ASE")
        }
        if(ASARadio.Value){
            saveGUIToStorage("ASA")
        }

        global ASESearchSelfX := searchSelf["ASEX"]
        global ASASearchSelfX := searchSelf["ASAX"]
        global ASESearchSelfY := searchSelf["ASEY"]
        global ASASearchSelfY := searchSelf["ASAY"]
            
        global ASEDepositAllX := depositAll["ASEX"]
        global ASADepositAllX := depositAll["ASAX"]
        global ASEDepositAllY := depositAll["ASEY"]
        global ASADepositAllY := depositAll["ASAY"]
        
        global ASEDropAllSelfX := dropAllSelf["ASEX"]
        global ASADropAllSelfX := dropAllSelf["ASAX"]
        global ASEDropAllSelfY := dropAllSelf["ASEY"]
        global ASADropAllSelfY := dropAllSelf["ASAY"]
        
        global ASESearchRemoteX := searchRemote["ASEX"]
        global ASASearchRemoteX := searchRemote["ASAX"]
        global ASESearchRemoteY := searchRemote["ASEY"]
        global ASASearchRemoteY := searchRemote["ASAY"]
        
        global ASETakeAllX := takeAll["ASEX"]
        global ASATakeAllX := takeAll["ASAX"]
        global ASETakeAllY := takeAll["ASEY"]
        global ASATakeAllY := takeAll["ASAY"]
        
        global ASEDropAllRemoteX := dropAllRemote["ASEX"]
        global ASADropAllRemoteX := dropAllRemote["ASAX"]
        global ASEDropAllRemoteY := dropAllRemote["ASEY"]
        global ASADropAllRemoteY := dropAllRemote["ASAY"]

        writeAllCoordsToIni()
        MsgBox("Settings Saved Successfully")
        showSettingsGUI()
        calibrationMenu.Destroy()
    }

    backButton(*) {
        readAllCoordsFromIni()
        showSettingsGUI()
        calibrationMenu.Destroy()
    }

    closeButton(*) {
        readAllCoordsFromIni()
        calibrationMenu.Destroy()
    }
}