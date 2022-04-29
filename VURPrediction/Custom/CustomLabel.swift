//
//  CustomLabel.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 10.04.2022.
//

import Foundation
import UIKit

final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
