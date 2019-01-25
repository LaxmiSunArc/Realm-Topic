//
//  NextButton.swift
//  DrinkWater
//
//  Created by Anand Suthar on 03/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

class NextButton: UIButton {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.black.setFill()
        path.fill()
    }
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
   
    
    
}
