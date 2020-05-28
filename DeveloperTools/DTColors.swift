//
//  DTColors.swift
//  DeveloperTools
//
//  Created by ZHXW on 2020/5/28.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation
import AppKit

public class DTColors {
    class public func color(with value: Int32) -> NSColor {
        let red = CGFloat((value & 0x00FF0000) >> 16) / 255.0
        let green = CGFloat((value & 0x0000FF00) >> 8) / 255.0
        let blue = CGFloat(value & 0x000000FF) / 255.0
        return NSColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class public func color(with value: String) -> NSColor {
        var colorValue: Int32 = 0
        var strValue = value
        if value.starts(with: "0x") || value.starts(with: "0X") {
            strValue = String(value.dropFirst(2))
        }
        if strValue.starts(with: "#") {
            strValue = String(strValue.dropFirst())
        }
        if strValue.count < 6 {
            let lost = 6 - strValue.count
            for _ in 0..<lost {
                strValue += "0"
            }
        }
        let redStr = String(strValue.dropLast(4))
        let greenStr = String(strValue.dropFirst(2).dropLast(2))
        let blueStr = String(strValue.dropFirst(4))
        
        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        if Scanner(string: redStr).scanHexInt64(&r)
            && Scanner(string: greenStr).scanHexInt64(&g)
            && Scanner(string: blueStr).scanHexInt64(&b) {
            colorValue = (Int32(r) << 16) | (Int32(g) << 8) | Int32(b)
        }
        
        return color(with: colorValue)
    }
}
