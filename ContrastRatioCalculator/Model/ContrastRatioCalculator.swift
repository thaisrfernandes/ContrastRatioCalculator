import Darwin
import SwiftUI

public class ContrastRatioCalculator {
    var color1: Color?
    var color2: Color?
    
    var hexColor1: String?
    var hexColor2: String?
    
    public init(color1: Color, color2: Color) {
        self.color1 = color1
        self.color2 = color2
    }
    
    public init(color1: String, color2: String) {
        self.hexColor1 = color1
        self.hexColor2 = color2
    }

    public var result: Double {
        if let rgb = getRgb(from: color1, or: hexColor1),
           let rgb2 = getRgb(from: color2, or: hexColor2) {

            let l1 = calcRelativeLuminance(red: Int(rgb[0]), green: Int(rgb[1]), blue: Int(rgb[2]))

            let l2 = calcRelativeLuminance(red: Int(rgb2[0]), green: Int(rgb2[1]), blue: Int(rgb2[2]))

            return calcContrastRatio(luminance1: l1, luminance2: l2)

        } else {
            return 0.0
        }
    }

    func calcContrastRatio(luminance1: Double, luminance2: Double) -> Double {
        let l1: Double
        let l2: Double

        if luminance1 > luminance2 {
            l1 = luminance1
            l2 = luminance2
        } else {
            l1 = luminance2
            l2 = luminance1
        }
        let calc1 = (l1 + 0.05)
        let calc2 = (l2 + 0.05)

        let res = calc1/calc2

        return res
    }

    func calcRelativeLuminance(red: Int, green: Int, blue: Int) -> Double {
        var luminances: [Double] = []

        [red, green, blue].forEach { color in
            let luminance = Double(color)/Double(255)

            if luminance <= 0.03928 {
                luminances.append(luminance/12.92)
            } else {
                luminances.append(pow((luminance + 0.055)/1.055,2.4))
            }
        }

        let r = luminances[0]
        let g = luminances[1]
        let b = luminances[2]

        return ((0.2126 * r) + (0.7152 * g) + (0.0722 * b))
    }
}
