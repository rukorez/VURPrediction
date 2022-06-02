//
//  LaunchView.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 02.06.2022.
//

import UIKit

final class LaunchView: UIView {
    
    private lazy var logo: UIImageView = {
        var logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LaunchIcon")
        logo.layer.cornerRadius = 25
        logo.clipsToBounds = true
        return logo
    }()
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VUR Prediction"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        backgroundColor = .systemGray6
        addSubview(logo)
        addSubview(label)
    }
    
}

// MARK: - Constraints

extension LaunchView {
    
    private func setConstraints() {
        let const = [
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 250),
            logo.heightAnchor.constraint(equalToConstant: 250),
            
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(const)
    }
    
}
