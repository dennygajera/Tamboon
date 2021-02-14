//
//  UITextField+.swift
//
//  Created by Darshan Gajera on 2/12/21.
//

import Foundation
import UIKit
extension UITextField {
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }

        if let right = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setRightView(img: UIImage) {
        let imageView = UIImageView(image: img)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.rightViewMode = .always
        self.rightView = imageView
    }
    
    func setLeftIcon(_ icon: UIImage) {
        
        let padding = 20
        let size = 20
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: (Int(outerView.bounds.width) - size) / 2, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
    
    @IBInspectable
    var setScalable: Bool {
        set{
            var fontValue = self.font?.pointSize
            if Display.typeIsLike == .iphone5 {
                fontValue = fontValue!
            } else if Display.typeIsLike == .iphone6 || Display.typeIsLike == .iphoneX {
                fontValue = fontValue! + 1
            } else if Display.typeIsLike == .iphone6plus {
                fontValue = fontValue! + 2
            }
            self.font =  UIFont(name: (self.font?.fontName)!, size: CGFloat(fontValue!))!
        }
        get{
            return true
        }
    }
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
            let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
            let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

            let toolbar: UIToolbar = UIToolbar()
            toolbar.barStyle = .default
            toolbar.items = [
                UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
                UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
                UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
            ]
            toolbar.sizeToFit()

            self.inputAccessoryView = toolbar
        }

        // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
