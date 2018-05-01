//
//  Utils.swift
//  ABChoiceView
//
//  Created by Aviv Ben Shabat on 23/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadView(fromNib name: String) -> UIView {
        let nib = UINib(nibName: name, bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

// Taken from https://github.com/instamobile/swift-tutorials/blob/master/UIColor%2BHex.swift
extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

