//
//  UILabel+.swift
//
//  Created by Darshan Gajera on 21/06/18.
//
//swiftlint:disable all

import UIKit

extension UILabel {
    @IBInspectable
    var setScalable: Bool {
        set{
            var fontValue = self.font.pointSize
            if Display.typeIsLike == .iphone5 {
                
            } else if Display.typeIsLike == .iphone6 || Display.typeIsLike == .iphoneX {
                fontValue = fontValue + 1
            } else if Display.typeIsLike == .iphone6plus {
                fontValue = fontValue + 2
            }
            self.font =  UIFont(name: (self.font.fontName), size: CGFloat(fontValue))!
        }
        get{
            return true
        }
    }

    
    var isTruncated: Bool {
        guard let labelText = text else {
            return false
        }
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font!],
            context: nil).size

        return labelTextSize.height > bounds.size.height
    }
}
