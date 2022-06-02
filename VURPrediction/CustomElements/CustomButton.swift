//
//  CustomButton.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 29.04.2022.
//

import UIKit

final class CustomButton: UIButton {
    
    var onTap: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
    
        self.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
    
}
