#Requires AutoHotkey v2.0-beta

class guiOptions {
    ;;;;;Font Effects;;;;;
    static fontEffectNorm := "norm "
    static fontEffectBold := "bold "
    static fontEffectItalic := "italic "
    static fontEffectStrikethrough := "strike "
    static fontEffectUnderline := "underline "

    ;;;;;Font Sizes;;;;;
    static fontSizeSmall := "s12 "
    static fontSizeMedium := "s15 "
    static fontSizeLarge := "s18 "

    ;;;;;Font Formatting;;;;;
    static fontColor := "cC5C5C5 "
    static fontName := "Consolas"
    static centerText := " 0x200 Center"
    
    ;;;;;Element Positioning;;;;;
    static nextInLine := " x+10 "
    static newRow := "x15 y+15"
    static firstInsideGroupBox := " xp10 yp25 "
    static editBoxInLine := " x+0 yp-3"
    static afterEditBox := " x+10 yp3"
    static nextGroupBox := " x33 y+25 "
    
    ;;;;;Dimensions;;;;;
    static coordsEditBoxSize := " r1 w50 "
    static coordsGroupBoxSize := " w205 h60 "

    ;;;;;Element Visuals;;;;;
    static backgroundColor := "1f1f1f"
    static buttonColor := " Background303030 "
    static includeBorder := " Border "
    static coordsEditBoxVisuals := " -VScroll Background343a40 "

    ;;;;;Combinations;;;;;
    static inlineEditBox := this.coordsEditBoxSize this.coordsEditBoxVisuals this.editBoxInLine

    static defaultTextOptions := guiOptions.fontEffectNorm guiOptions.fontSizeSmall guiOptions.fontColor
}

class TextFieldProps {
    fieldWidth := 0
    fieldHeight := 0
    text := ""
    fontOptions := ""
    fontName := ""
    buttonOptions := ""
    textOptions := ""

    __New(text := "Placeholder", fontOptions := guiOptions.defaultTextOptions, fontName := guiOptions.fontName) {
        TempGui := Gui()
        TempGui.SetFont(fontOptions, fontName)
        TempGui.Add("Text",, text).GetPos(&x, &y, &width, &height)
        
        this.text := text
        this.fieldWidth := " w" width + (TempGui.MarginX * 2)
        this.fieldHeight := " h" height + (TempGui.MarginY * 2)
        this.fontOptions := fontOptions
        this.fontName := fontName
        this.buttonOptions := this.fieldWidth this.fieldHeight guiOptions.buttonColor guiOptions.centerText guiOptions.includeBorder
        this.textOptions := this.fieldWidth this.fieldHeight guiOptions.centerText
    }
}