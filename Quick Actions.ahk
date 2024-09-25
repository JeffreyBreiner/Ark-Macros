#Requires AutoHotkey v2.0-beta

takeAll(){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASETakeAllX
        ypos := ASETakeAllY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASATakeAllX
        ypos := ASATakeAllY
    }
    
    Click(xpos, ypos)
}

depositAll(){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASEDepositAllX
        ypos := ASEDepositAllY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASADepositAllX
        ypos := ASADepositAllY
    }
    
    Click(xpos, ypos)
}

dropAllSelf(){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASEDropAllSelfX
        ypos := ASEDropAllSelfY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASADropAllSelfX
        ypos := ASADropAllSelfY
    }
    
    Click(xpos, ypos)
}

dropAllRemote(){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASEDropAllRemoteX
        ypos := ASEDropAllRemoteY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASADropAllRemoteX
        ypos := ASADropAllRemoteY
    }
    
    Click(xpos, ypos)
}

searchSelf(searchTerm){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASESearchSelfX
        ypos := ASESearchSelfY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASASearchSelfX
        ypos := ASASearchSelfY
    }
    
    Click(xpos, ypos)
    Sleep(100)
    Send(searchTerm)
}

searchRemote(searchTerm){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASESearchRemoteX
        ypos := ASESearchRemoteX
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASASearchRemoteX
        ypos := ASASearchRemoteY
    }
    
    Click(xpos, ypos)
    Sleep(100)
    Send(searchTerm)
}

searchTakeAll(searchTerm){
    searchRemote(searchTerm)
    Sleep(100)
    takeAll()
}

dropSearchSelf(searchTerm){
    searchSelf(searchTerm)
    Sleep(100)
    dropAllSelf()
}

dropSearchRemote(searchTerm){
    searchRemote(searchTerm)
    Sleep(200)
    dropAllRemote()
}

closeInventory(){
    Send("c")
}

depositKibble(){
    searchSelf("kibble")
    depositAll()
    closeInventory()
}

craftMax(xpos := "default", ypos := "default"){
    if(WinActive(ASE_WIN_EXE)){
        xpos := ASEFirstInventSlotRemoteX
        ypos := ASEFirstInventSlotRemoteY
    }
    if(WinActive(ASA_WIN_EXE)){
        xpos := ASAFirstInventSlotRemoteX
        ypos := ASAFirstInventSlotRemoteY
    }

    Click(xpos, ypos)
    Sleep(100)
    loop 20{
        Send("a")
        Sleep(50)
    }
}