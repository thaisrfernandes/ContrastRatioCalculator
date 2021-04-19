//
//  PointsEngine.swift
//  Layout
//
//  Created by Thaís Fernandes on 16/04/21.
//

import Foundation
import SwiftUI

class PointsEngine {
    let ratio: Double
    let fontSize1: CGFloat
    let fontSize2: CGFloat
    
    init(ratio: Double, fontSize1: CGFloat, fontSize2: CGFloat) {
        self.ratio = ratio
        self.fontSize1 = fontSize1
        self.fontSize2 = fontSize2
    }
    
    var result: Double {

        let ratio1 = (ratio/21) * 0.33
        
        let size1 = fontSize1 >= 18 ? 0.33 : (Double(fontSize1)/18) * 0.33
        
        let size2 = fontSize2 >= 9 ? 0.33 : (Double(fontSize2)/9) * 0.33

        let points = ratio1 + size1 + size2
        
        if fontSize1 < 4 || fontSize2 < 4 || fontSize1 > 170 || ratio < 1.5 {
            return 0
        }
        
        return points
    }
    
}
