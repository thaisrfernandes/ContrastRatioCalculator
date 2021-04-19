import Foundation
import SwiftUI

func getCharacter(from string: String, offset: Int) -> Character {
    return string[string.index(string.startIndex, offsetBy: offset)]
}

func getRgb(from color: Color?, or hexColor: String?) -> [Double]? {
            
    if let color = color {
        return UIColor(color).cgColor.components?.map { round(Double($0) * Double(255)) }
    }
    
    if let hexColor = hexColor {
        return hexToRgb(hexColor)?.map { Double($0) }
    }
    
    return nil
}

func ratioText(for ratio: Double) -> String {
    var value: String
    
    let isRound = String(format: "%.2f", ratio).contains(".00")
    
    let shouldRound = String(format: "%.2f", ratio).contains(".9") || String(format: "%.2f", ratio).contains(".8")
    
    if isRound {
        value = String(format: "%.f", ratio)
    } else if shouldRound {
        value = String(format: "%.f", round(ratio))
        
    } else {
        value = String(format: "%.2f", ratio)
    }
    
    return "\(value) : 1"
}

func rgbToColor(_ colors: [UInt16]) -> Color {
    let colors = colors.map { Double($0) / Double(255) }
    return Color(red: colors[0], green: colors[1], blue: colors[2])
}

func hexToDec(_ hex: String) -> UInt16? {
    return UInt16(hex, radix: 16) ?? nil
}

func hexToRgb(_ color: String) -> [UInt16]? {
    if (color.count < 7 || color.count > 7) {
        return nil;
    }
    
    let hex = String(color.split(separator: "#")[0])
    let redHex = String("\(getCharacter(from: hex, offset: 0))\(getCharacter(from: hex, offset: 1))")
    let greenHex = String("\(getCharacter(from: hex, offset: 2))\(getCharacter(from: hex, offset: 3))")
    let blueHex = String("\(getCharacter(from: hex, offset: 4))\(getCharacter(from: hex, offset: 5))")
    
    guard
        let red = hexToDec(redHex),
        let green = hexToDec(greenHex),
        let blue = hexToDec(blueHex)
    else {
        return nil
    }
    
    return [red, green, blue]
}

func rgbToHex(_ colors: [UInt16]) -> String {
    var chars: String = ""
        
    colors.forEach { color in
        chars.append(String(color / 16, radix: 16))
        chars.append(String(color % 16, radix: 16))
    }
    
    if (chars.count > 6) {
        return "error"
    }
    
    return chars.uppercased()
}

func hexToColor(_ color: String) -> Color {
    guard let rgb = hexToRgb(color) else {
        return Color.black
    }
    
    return rgbToColor(rgb)
}

func colorToHex(_ color: Color) -> String {
    
    guard let rgb = getRgb(from: color, or: nil)?.map({ UInt16($0) }) else {
        return "#000000"
    }
    
    return rgbToHex([rgb[0], rgb[1], rgb[2]])
}
