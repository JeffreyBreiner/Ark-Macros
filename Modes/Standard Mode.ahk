#Requires AutoHotkey v2.0-beta



takeAllAndClose(*) {
    takeAll()
    Sleep(100)
    closeInventory()
}

depositAllAndClose(*) {
    depositAll()
    Sleep(100)
    closeInventory()
}

depositRawMeat() {
    searchSelf("raw")
    Sleep(100)
    depositAll()
    Sleep(100)
    closeInventory()
}