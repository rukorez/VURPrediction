//
//  InfoViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 27.04.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var infoView = InfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = infoView
    }

}

