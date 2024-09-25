#Requires AutoHotkey v2.0-beta

global iniFileName := "Resources\settings.ini"

;;;;;;;;;;;;;;;;;;;;;;;;SCREEN COORDS;;;;;;;;;;;;;;;;;;;;;;;;

;DEPOSIT ALL
readDepositAllFromIni(){
    global ASEDepositAllX := IniRead(iniFileName, "Screen Coords", "ASEDepositAllX", 360)
    global ASEDepositAllY := IniRead(iniFileName, "Screen Coords", "ASEDepositAllY", 205)
    
    global ASADepositAllX := IniRead(iniFileName, "Screen Coords", "ASADepositAllX", 360)
    global ASADepositAllY := IniRead(iniFileName, "Screen Coords", "ASADepositAllY", 205)
}

;TAKE ALL
readTakeAllFromIni(){
    global ASETakeAllX := IniRead(iniFileName, "Screen Coords", "ASETakeAllX", 1420)
    global ASETakeAllY := IniRead(iniFileName, "Screen Coords", "ASETakeAllY", 205)
    
    global ASATakeAllX := IniRead(iniFileName, "Screen Coords", "ASATakeAllX", 1390)
    global ASATakeAllY := IniRead(iniFileName, "Screen Coords", "ASATakeAllY", 210)
}

;DROP ALL SELF
readDropAllSelfFromIni(){
    global ASEDropAllSelfX := IniRead(iniFileName, "Screen Coords", "ASEDropAllSelfX", 400)
    global ASEDropAllSelfY := IniRead(iniFileName, "Screen Coords", "ASEDropAllSelfY", 200)
    
    global ASADropAllSelfX := IniRead(iniFileName, "Screen Coords", "ASADropAllSelfX", 400)
    global ASADropAllSelfY := IniRead(iniFileName, "Screen Coords", "ASADropAllSelfY", 200)
}

;DROP ALL REMOTE
readDropAllRemoteFromIni(){
    global ASEDropAllRemoteX := IniRead(iniFileName, "Screen Coords", "ASEDropAllRemoteX", 1470)
    global ASEDropAllRemoteY := IniRead(iniFileName, "Screen Coords", "ASEDropAllRemoteY", 200)
    
    global ASADropAllRemoteX := IniRead(iniFileName, "Screen Coords", "ASADropAllRemoteX", 1420)
    global ASADropAllRemoteY := IniRead(iniFileName, "Screen Coords", "ASADropAllRemoteY", 210)
}

;SEARCH SELF
readSearchSelfFromIni(){
    global ASESearchSelfX := IniRead(iniFileName, "Screen Coords", "ASESearchSelfX", 270)
    global ASESearchSelfY := IniRead(iniFileName, "Screen Coords", "ASESearchSelfY", 180)
    
    global ASASearchSelfX := IniRead(iniFileName, "Screen Coords", "ASASearchSelfX", 270)
    global ASASearchSelfY := IniRead(iniFileName, "Screen Coords", "ASASearchSelfY", 180)
}

;SEARCH REMOTE
readSearchRemoteFromIni(){
    global ASESearchRemoteX := IniRead(iniFileName, "Screen Coords", "ASESearchRemoteX", 1330)
    global ASESearchRemoteY := IniRead(iniFileName, "Screen Coords", "ASESearchRemoteY", 180)
    
    global ASASearchRemoteX := IniRead(iniFileName, "Screen Coords", "ASASearchRemoteX", 1330)
    global ASASearchRemoteY := IniRead(iniFileName, "Screen Coords", "ASASearchRemoteY", 180)
}

;FIRST INVENT SLOT SELF
readFirstInventSlotSelfFromIni(){
    global ASEFirstInventSlotSelfX := IniRead(iniFileName, "Screen Coords", "ASEFirstInventSlotSelfX", 1250)
    global ASEFirstInventSlotSelfY := IniRead(iniFileName, "Screen Coords", "ASEFirstInventSlotSelfY", 280)
    
    global ASAFirstInventSlotSelfX := IniRead(iniFileName, "Screen Coords", "ASAFirstInventSlotSelfX", 1250)
    global ASAFirstInventSlotSelfY := IniRead(iniFileName, "Screen Coords", "ASAFirstInventSlotSelfY", 280)
}

;FIRST INVENT SLOT REMOTE
readFirstInventSlotRemoteFromIni(){
    global ASEFirstInventSlotRemoteX := IniRead(iniFileName, "Screen Coords", "ASEFirstInventSlotRemoteX", 1250)
    global ASEFirstInventSlotRemoteY := IniRead(iniFileName, "Screen Coords", "ASEFirstInventSlotRemoteY", 280)
    
    global ASAFirstInventSlotRemoteX := IniRead(iniFileName, "Screen Coords", "ASAFirstInventSlotRemoteX", 1250)
    global ASAFirstInventSlotRemoteY := IniRead(iniFileName, "Screen Coords", "ASAFirstInventSlotRemoteY", 280)
}

readAllCoordsFromIni(){
    readDepositAllFromIni()
    readTakeAllFromIni()
    readDropAllSelfFromIni()
    readDropAllRemoteFromIni()
    readSearchSelfFromIni()
    readSearchRemoteFromIni()
    readFirstInventSlotSelfFromIni()
    readFirstInventSlotRemoteFromIni()
}

writeDepositAllToIni(){
    IniWrite(ASEDepositAllX, iniFileName, "Screen Coords", "ASEDepositAllX")
    IniWrite(ASEDepositAllY, iniFileName, "Screen Coords", "ASEDepositAllY")

    IniWrite(ASADepositAllX, iniFileName, "Screen Coords", "ASADepositAllX")
    IniWrite(ASADepositAllY, iniFileName, "Screen Coords", "ASADepositAllY")
}

writeTakeAllToIni(){
    IniWrite(ASETakeAllX, iniFileName, "Screen Coords", "ASETakeAllX")
    IniWrite(ASETakeAllY, iniFileName, "Screen Coords", "ASETakeAllY")

    IniWrite(ASATakeAllX, iniFileName, "Screen Coords", "ASATakeAllX")
    IniWrite(ASATakeAllY, iniFileName, "Screen Coords", "ASATakeAllY")
}

writeDropAllSelfToIni(){
    IniWrite(ASEDropAllSelfX, iniFileName, "Screen Coords", "ASEDropAllSelfX")
    IniWrite(ASEDropAllSelfY, iniFileName, "Screen Coords", "ASEDropAllSelfY")

    IniWrite(ASADropAllSelfX, iniFileName, "Screen Coords", "ASADropAllSelfX")
    IniWrite(ASADropAllSelfY, iniFileName, "Screen Coords", "ASADropAllSelfY")
}

writeDropAllRemoteToIni(){
    IniWrite(ASEDropAllRemoteX, iniFileName, "Screen Coords", "ASEDropAllRemoteX")
    IniWrite(ASEDropAllRemoteY, iniFileName, "Screen Coords", "ASEDropAllRemoteY")

    IniWrite(ASADropAllRemoteX, iniFileName, "Screen Coords", "ASADropAllRemoteX")
    IniWrite(ASADropAllRemoteY, iniFileName, "Screen Coords", "ASADropAllRemoteY")
}

writeSearchSelfToIni(){
    IniWrite(ASESearchSelfX, iniFileName, "Screen Coords", "ASESearchSelfX")
    IniWrite(ASESearchSelfY, iniFileName, "Screen Coords", "ASESearchSelfY")

    IniWrite(ASASearchSelfX, iniFileName, "Screen Coords", "ASASearchSelfX")
    IniWrite(ASASearchSelfY, iniFileName, "Screen Coords", "ASASearchSelfY")
}

writeSearchRemoteToIni(){
    IniWrite(ASESearchRemoteX, iniFileName, "Screen Coords", "ASESearchRemoteX")
    IniWrite(ASESearchRemoteY, iniFileName, "Screen Coords", "ASESearchRemoteY")

    IniWrite(ASASearchRemoteX, iniFileName, "Screen Coords", "ASASearchRemoteX")
    IniWrite(ASASearchRemoteY, iniFileName, "Screen Coords", "ASASearchRemoteY")
}

writeFirstInventSlotSelfToIni(){
    IniWrite(ASEFirstInventSlotSelfX, iniFileName, "Screen Coords", "ASEFirstInventSlotSelfX")
    IniWrite(ASEFirstInventSlotSelfY, iniFileName, "Screen Coords", "ASEFirstInventSlotSelfY")

    IniWrite(ASAFirstInventSlotSelfX, iniFileName, "Screen Coords", "ASAFirstInventSlotSelfX")
    IniWrite(ASAFirstInventSlotSelfY, iniFileName, "Screen Coords", "ASAFirstInventSlotSelfY")
}

writeFirstInventSlotRemoteToIni(){
    IniWrite(ASEFirstInventSlotRemoteX, iniFileName, "Screen Coords", "ASEFirstInventSlotRemoteX")
    IniWrite(ASEFirstInventSlotRemoteY, iniFileName, "Screen Coords", "ASEFirstInventSlotRemoteY")

    IniWrite(ASAFirstInventSlotRemoteX, iniFileName, "Screen Coords", "ASAFirstInventSlotRemoteX")
    IniWrite(ASAFirstInventSlotRemoteY, iniFileName, "Screen Coords", "ASAFirstInventSlotRemoteY")
}

writeAllCoordsToIni(){
    writeDepositAllToIni()
    writeTakeAllToIni()
    writeDropAllSelfToIni()
    writeDropAllRemoteToIni()
    writeSearchSelfToIni()
    writeSearchRemoteToIni()
    writeFirstInventSlotSelfToIni()
    writeFirstInventSlotRemoteToIni()
}

restoreCoordsDefaults(){
    IniWrite("", iniFileName, "Screen Coords")
    readAllCoordsFromIni()
    writeAllCoordsToIni()
}

readAllCoordsFromIni()