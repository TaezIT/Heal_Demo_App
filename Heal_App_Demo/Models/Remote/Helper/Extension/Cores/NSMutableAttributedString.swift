//
//  NSMutableAttributedString.swift
//  Heal_App_Demo
//
//  Created by Phạm Tuấn Anh on 19/05/2022.
//

import UIKit

extension NSMutableAttributedString {
    
    func attrStr(text: String,
                 font: UIFont? = nil,
                 textColor: UIColor? = nil,
                 alignment: NSTextAlignment? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let font = font {
            attributes[.font] = font
        }
        if let textColor = textColor {
            attributes[.foregroundColor] = textColor
        }
        
//        if let alignment = alignment {
//            let paragraph = NSMutableParagraphStyle()
//            paragraph.alignment = alignment
//            
//            attributes[.paragraphStyle] = paragraph
//        }
        
        let string = NSMutableAttributedString(string: text, attributes: attributes)
        self.append(string)
        return self
    }
}

