//
//  CustomTextField.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 12.03.2022.
//

import UIKit

final class CustomTextField: UITextField {

    let insets: UIEdgeInsets
        
        init(insets: UIEdgeInsets) {
            self.insets = insets
            super.init(frame: .zero)
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .white
            textColor = .black
            keyboardType = UIKeyboardType.decimalPad
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: insets)
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: insets)
        }
}
