//
//  TextField.swift
//  GUM
//
//  Created by Malik Farhan Asim on 27/03/2021.
//

import UIKit

class TextField: UITextField {

    init(text: String, textColor: UIColor , font: UIFont) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor
        self.textAlignment = .natural
        self.font = UIFont(name: (font.fontName), size: CGFloat(Int(font.pointSize).autoSized))
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20.autoSized, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = .always
        self.rightView = padding
        self.rightViewMode = .always
        self.tintColor = .black
        self.borderStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        self.layer.cornerRadius = 15.autoSized
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
