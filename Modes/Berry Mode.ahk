#Requires AutoHotkey v2.0-beta

filterBerries(){
    if(!seeds){
        dropSearchRemote("seed")
    }else{
        searchTakeAll("seed")
    }

    Sleep(100)
    takeWantedBerries()
    Sleep(150)
    dropAllRemote()
    closeInventory()
}

takeWantedBerries() {
    if(csap){
        searchTakeAll("sap")
        Sleep(100)
    }
    if(stimberrry){
        searchTakeAll("stim")
        Sleep(100)
    }
    if(narcoberry){
        searchTakeAll("narc")
        Sleep(100)
    }
    if(mejoberry){
        searchTakeAll("j")
        Sleep(100)
    }
    if(tintoberry){
        searchTakeAll("tint")
        Sleep(100)
    }
    if(azulberry){
        searchTakeAll("z")
        Sleep(100)
    }
    if(amarberry){
        searchTakeAll("arb")
        Sleep(100)
    }
}

dropUnwantedBerries(){
    if(foodBerries){
        searchRemote("s")
        Sleep(100)
        dropAllRemote()
        Sleep(100)
        searchRemote("arc")
        Sleep(100)
        dropAllRemote()
        return
    }
    
    if(!seeds){
        dropSearchRemote("seed")
        Sleep(100)
    }
    if(!stimberrry){
        dropSearchRemote("stim")
        Sleep(100)
    }
    if(!narcoberry){
        dropSearchRemote("narc")
        Sleep(100)
    }
    if(!mejoberry){
        dropSearchRemote("j")
        Sleep(100)
    }
    if(!tintoberry){
        dropSearchRemote("tint")
        Sleep(100)
    }
    if(!azulberry){
        dropSearchRemote("z")
        Sleep(100)
    }
    if(!amarberry){
        dropSearchRemote("arb")
        Sleep(100)
    }

    dropSearchRemote("v")
    dropSearchRemote("cian")
    dropSearchRemote("g")

    closeInventory()
}

dropAllFromDedi(){
    takeAll()
    Sleep(100)
    dropAllSelf()
}

depositAllBerries(){
    searchSelf("err")
    Sleep(100)
    depositAll()
}