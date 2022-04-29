//
//  CalculateViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 12.03.2022.
//

import Foundation
import UIKit

class CalculateViewController: UIViewController {
    
    lazy var header: UILabel = {
        var header = UILabel()
        header.text = "Вероятность результата эндоскопической коррекции"
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.numberOfLines = 0
        header.textAlignment = .center
        return header
    }()
    
    lazy var parameter1: UILabel = {
        var par = UILabel()
        par.text = "УЗИ мочеточника (мм)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    lazy var parameter2: UILabel = {
        var par = UILabel()
        par.text = "М/ПП (UDR)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    lazy var parameter3: UILabel = {
        var par = UILabel()
        par.text = "Степень ПМР"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    lazy var parameter4: UILabel = {
        var par = UILabel()
        par.text = "Момент возникновения"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    lazy var parameter5: UILabel = {
        var par = UILabel()
        par.text = "УЗИ лоханки (мм)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    lazy var result1: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 1 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()
    
    lazy var result2: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 2 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()

    lazy var result3: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 3 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()
    
    lazy var input1 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    lazy var input2 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    lazy var input3 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    lazy var input4 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    lazy var input5 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    
    lazy var calcButton: CustomButton = {
        var button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Рассчитать", for: .normal)
        button.onTap = { self.tap() }
        return button
    }()
    
    lazy var firstCorrection = CustomLabel()
    lazy var secondCorrection = CustomLabel()
    lazy var thirdCorrection = CustomLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        addViews()
        setConstraints()
        hideKeyboard()
    }
    
    private func addViews() {
        view.addSubview(header)
        view.addSubview(parameter1)
        view.addSubview(parameter2)
        view.addSubview(parameter3)
        view.addSubview(parameter4)
        view.addSubview(parameter5)
        view.addSubview(result1)
        view.addSubview(result2)
        view.addSubview(result3)
        view.addSubview(input1)
        view.addSubview(input2)
        view.addSubview(input3)
        view.addSubview(input4)
        view.addSubview(input5)
        view.addSubview(firstCorrection)
        view.addSubview(secondCorrection)
        view.addSubview(thirdCorrection)
        view.addSubview(calcButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setLayout()
    }
    
    private func tap() {
        let formula = Formula(parametr1: input1.text, parametr2: input2.text, parametr3: input3.text, parametr4: input4.text, parametr5: input5.text)
        firstCorrection.text = formula.first()
        secondCorrection.text = formula.second()
        thirdCorrection.text = formula.third()
        view.endEditing(true)
    }
    
    private func setLayout() {
        input1.layer.borderWidth = CGFloat(1)
        input1.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 10)
        input1.layer.cornerRadius = 10
        input2.layer.borderWidth = CGFloat(1)
        input2.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 10)
        input2.layer.cornerRadius = 10
        input3.layer.borderWidth = CGFloat(1)
        input3.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 10)
        input3.layer.cornerRadius = 10
        input4.layer.borderWidth = CGFloat(1)
        input4.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 10)
        input4.layer.cornerRadius = 10
        input5.layer.borderWidth = CGFloat(1)
        input5.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 10)
        input5.layer.cornerRadius = 10
        calcButton.layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        let constraints = [
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            header.heightAnchor.constraint(equalToConstant: 60),
        
            parameter1.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            parameter1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            parameter1.heightAnchor.constraint(equalToConstant: 35),
            parameter1.widthAnchor.constraint(equalToConstant: 262),
            
            input1.topAnchor.constraint(equalTo: parameter1.topAnchor),
            input1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            input1.leadingAnchor.constraint(equalTo: parameter1.trailingAnchor, constant: 12),
            input1.heightAnchor.constraint(equalToConstant: 35),

            parameter2.topAnchor.constraint(equalTo: parameter1.bottomAnchor, constant: 10),
            parameter2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            parameter2.heightAnchor.constraint(equalToConstant: 35),
            parameter2.widthAnchor.constraint(equalToConstant: 262),
            
            input2.topAnchor.constraint(equalTo: parameter2.topAnchor),
            input2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            input2.leadingAnchor.constraint(equalTo: parameter2.trailingAnchor, constant: 12),
            input2.heightAnchor.constraint(equalToConstant: 35),

            parameter3.topAnchor.constraint(equalTo: parameter2.bottomAnchor, constant: 10),
            parameter3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            parameter3.heightAnchor.constraint(equalToConstant: 35),
            parameter3.widthAnchor.constraint(equalToConstant: 262),
            
            input3.topAnchor.constraint(equalTo: parameter3.topAnchor),
            input3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            input3.leadingAnchor.constraint(equalTo: parameter3.trailingAnchor, constant: 12),
            input3.heightAnchor.constraint(equalToConstant: 35),

            parameter4.topAnchor.constraint(equalTo: parameter3.bottomAnchor, constant: 10),
            parameter4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            parameter4.heightAnchor.constraint(equalToConstant: 35),
            parameter4.widthAnchor.constraint(equalToConstant: 262),
            
            input4.topAnchor.constraint(equalTo: parameter4.topAnchor),
            input4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            input4.leadingAnchor.constraint(equalTo: parameter4.trailingAnchor, constant: 12),
            input4.heightAnchor.constraint(equalToConstant: 35),

            parameter5.topAnchor.constraint(equalTo: parameter4.bottomAnchor, constant: 10),
            parameter5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            parameter5.heightAnchor.constraint(equalToConstant: 35),
            parameter5.widthAnchor.constraint(equalToConstant: 262),
            
            input5.topAnchor.constraint(equalTo: parameter5.topAnchor),
            input5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            input5.leadingAnchor.constraint(equalTo: parameter5.trailingAnchor, constant: 12),
            input5.heightAnchor.constraint(equalToConstant: 35),
            
            calcButton.topAnchor.constraint(equalTo: parameter5.bottomAnchor, constant: 40),
            calcButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            calcButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            result1.topAnchor.constraint(equalTo: calcButton.bottomAnchor, constant: 40),
            result1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            firstCorrection.topAnchor.constraint(equalTo: result1.bottomAnchor, constant: 10),
            firstCorrection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            result2.topAnchor.constraint(equalTo: result1.bottomAnchor, constant: 70),
            result2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            secondCorrection.topAnchor.constraint(equalTo: result2.bottomAnchor, constant: 10),
            secondCorrection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            result3.topAnchor.constraint(equalTo: result2.bottomAnchor, constant: 70),
            result3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            thirdCorrection.topAnchor.constraint(equalTo: result3.bottomAnchor, constant: 10),
            thirdCorrection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

    
}

//MARK: Скрытие клавиатуры по нажатию на UIView

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
