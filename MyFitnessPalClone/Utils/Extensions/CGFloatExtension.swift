//
//  CGFloatExtension.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

extension CGFloat {
    /// Screen size of device
    static let screenSize = UIScreen.main.bounds.size
    /// Dynamic Height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    static func dynamicHeight(height: Double) -> Double {
        screenSize.height * height
    }

    /// Dynamic Width by device
    /// - Parameter Width: Percent value
    /// - Returns: Calculated value for device Width
    static func dynamicWidth(width: Double) -> Double {
        screenSize.width * width
    }

    /// value = 2
    static var veryLow2: CGFloat = PaddingSize.veryLow2.rawValue
    /// value = 4
    static var veryLow: CGFloat = PaddingSize.veryLow.rawValue
    /// value = 6
    static var low3: CGFloat = PaddingSize.low3.rawValue
    /// value = 8
    static var low2: CGFloat = PaddingSize.low2.rawValue
    /// value = 12
    static var low: CGFloat = PaddingSize.low.rawValue
    /// Default padding values 16
    static var normal: CGFloat = PaddingSize.normal.rawValue
    /// value = 20
    static var medium3: CGFloat = PaddingSize.medium3.rawValue
    /// value = 24
    static var medium2: CGFloat = PaddingSize.medium2.rawValue
    /// value = 28
    static var medium: CGFloat = PaddingSize.medium.rawValue
    /// value = 32
    static var high3: CGFloat = PaddingSize.high3.rawValue
    /// value = 40
    static var high2: CGFloat = PaddingSize.high2.rawValue
    /// value = 50
    static var high: CGFloat = PaddingSize.high.rawValue
}

private enum PaddingSize: CGFloat {
    /// Value = 2
    case veryLow2 = 2
    /// Value = 4
    case veryLow = 4
    /// Value = 6
    case low3 = 6
    /// Value = 8
    case low2 = 8
    /// Value = 12
    case low = 12
    /// Value = 16
    case normal = 16
    /// Value = 20
    case medium3 = 20
    /// Value = 24
    case medium2 = 24
    /// Value = 28
    case medium = 28
    /// Value = 32
    case high3 = 32
    /// Value = 40
    case high2 = 40
    /// Value = 50
    case high = 50
}
