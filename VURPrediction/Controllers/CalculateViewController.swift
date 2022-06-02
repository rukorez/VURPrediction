//
//  CalculateViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 12.03.2022.
//

import Foundation
import UIKit

final class CalculateViewController: UIViewController {
    
    private lazy var calculateView = CalculateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = calculateView
        calculateView.delegate = self
        hideKeyboard()
    }

    
}

// MARK: - Delegate's Method

extension CalculateViewController: CalculateViewProtocol {
    
    func buttonTapped(view: CalculateView) {
        let formula = Formula(parametr1: view.input1.text, parametr2: view.input2.text, parametr3: view.input3.text, parametr4: view.input4.text, parametr5: view.input5.text)
        view.firstCorrection.text = formula.first()
        view.secondCorrection.text = formula.second()
        view.thirdCorrection.text = formula.third()
        view.endEditing(true)
    }
    
}

//MARK: - Hide Keyboard tap on View

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
