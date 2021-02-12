//
//  UIButton+.swift
//
//  Created by Darshan Gajera on 2/12/21.


import Foundation
import UIKit

extension UIButton {
    
    @IBInspectable
    var setScalable: Bool {
        set{
            var fontValue = self.titleLabel?.font.pointSize
            if Display.typeIsLike == .iphone5 {
                fontValue = fontValue! - 3
            } else if Display.typeIsLike == .iphone6 || Display.typeIsLike == .iphoneX {
                fontValue = fontValue! + 1
            } else if Display.typeIsLike == .iphone6plus || Display.typeIsLike == .iphoneXSMax {
                fontValue = fontValue! + 2
            }
            self.titleLabel?.font =  UIFont(name: (self.titleLabel?.font.fontName)!, size: CGFloat(fontValue!))!
        }
        get{
            return true
        }
    }
    
    @IBInspectable
    var setUnderLineText: Bool {
        set{
            let fontValue = (self.titleLabel?.font.pointSize)!
            let yourAttributes : [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontValue),
                NSAttributedString.Key.foregroundColor : self.titleLabel?.textColor ?? UIColor.white,
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
            let attributeString = NSMutableAttributedString(string: (self.titleLabel?.text)!,
                                                            attributes: yourAttributes)
            self.setAttributedTitle(attributeString, for: .normal)

        }
        get {
            return true
        }
    }
 
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
