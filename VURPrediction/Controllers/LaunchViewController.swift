//
//  LaunchViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 10.04.2022.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    private lazy var launchView = LaunchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = launchView
    }
    
}
