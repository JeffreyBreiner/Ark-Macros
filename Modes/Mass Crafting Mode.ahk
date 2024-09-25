#Requires AutoHotkey v2.0-beta

;;;;;ASE Crafting;;;;;
turnOnWhenFull(*){
    pullStackOut()
    Sleep(100)
    giveGas()
    Sleep(1000)
    turnOn()
}

startCrafting(*){
    depositAll()
    Sleep(100)
    craftGP(11)
    Sleep(100)
    closeInventory()
}

; first batch of GP out
folowupCraftAndPull(*){
    craftGP(4)
    Sleep(100)
    searchGP()
    Sleep(100)
    takeAll()
    Sleep(100)
    closeInventory()
}

craftGP(numOfCrafts){
    MouseMove(1500, 400)

    loop numOfCrafts{
        Sleep(100)
        Send("a")
    }
}

searchGP(){
    searchRemote("np")
}

turnOn(){
    Click(1050, 615)
}

pullStackOut(){
    MouseMove(1300, 740)
    Sleep(100)
    Send("t")
}

giveGas(){
    Click(256, 256)
    Click(256, 256)
}

;;;;;ASA Crafting;;;;;
massCraft(searchTerm){
    searchRemote(searchTerm)
    Sleep(100)
    craftMax()
    closeInventory()
}