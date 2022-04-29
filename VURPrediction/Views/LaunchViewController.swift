//
//  LaunchViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 10.04.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    lazy var logo: UIImageView = {
        var logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LaunchIcon")
        logo.layer.cornerRadius = 25
        logo.clipsToBounds = true
        return logo
    }()
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VUR Prediction"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        view.addSubview(logo)
        view.addSubview(label)
        setConstraints()
    }
    
    
    private func setConstraints() {
        let const = [
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 300),
            logo.heightAnchor.constraint(equalToConstant: 300),
            
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(const)
    }
    
}
