//
//  MainView.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 24.04.2022.
//

import UIKit

class MainView: UIView {

    var header: UILabel = {
        var header = UILabel()
        header.text = "Вероятность результата эндоскопической коррекции"
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.numberOfLines = 0
        header.textAlignment = .center
        return header
    }()
    
    var parameter1: UILabel = {
        var par = UILabel()
        par.text = "УЗИ мочеточника (мм)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    var parameter2: UILabel = {
        var par = UILabel()
        par.text = "М/ПП (UDR)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    var parameter3: UILabel = {
        var par = UILabel()
        par.text = "Степень ПМР"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    var parameter4: UILabel = {
        var par = UILabel()
        par.text = "Момент возникновения"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    var parameter5: UILabel = {
        var par = UILabel()
        par.text = "УЗИ лоханки (мм)"
        par.translatesAutoresizingMaskIntoConstraints = false
        return par
    }()
    
    var result1: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 1 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()
    
    var result2: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 2 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()

    var result3: UILabel = {
        var res = UILabel()
        res.text = "Вероятность успеха после 3 коррекции"
        res.translatesAutoresizingMaskIntoConstraints = false
        return res
    }()
    
    var input1 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    var input2 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    var input3 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    var input4 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    var input5 = CustomTextField(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    
    var calcButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Рассчитать", for: .normal)
        return button
    }()
    
    var firstCorrection = CustomLabel()
    var secondCorrection = CustomLabel()
    var thirdCorrection = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        calcButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
       addSubview(header)
       addSubview(parameter1)
       addSubview(parameter2)
       addSubview(parameter3)
       addSubview(parameter4)
       addSubview(parameter5)
       addSubview(result1)
       addSubview(result2)
       addSubview(result3)
       addSubview(input1)
       addSubview(input2)
       addSubview(input3)
       addSubview(input4)
       addSubview(input5)
       addSubview(firstCorrection)
       addSubview(secondCorrection)
       addSubview(thirdCorrection)
       addSubview(calcButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
    
    @objc func tap() {
        guard input1.text != "" && input2.text != "" && input3.text != "" && input4.text != "" && input5.text != "" else { return }
        guard let p1 = input1.text else { return }
        let par1 = NSString(string: p1).doubleValue
        guard let p2 = input2.text else { return }
        let par2 = NSString(string: p2).doubleValue
        guard let p3 = input3.text else { return }
        let par3 = NSString(string: p3).doubleValue
        guard let p4 = input4.text else { return }
        let par4 = NSString(string: p4).doubleValue
        guard let p5 = input5.text else { return }
        let par5 = NSString(string: p5).doubleValue
        let formula = Formula()
        firstCorrection.text = "\(NSString(format: "%.2f", formula.first(par1: par1, par2: par2, par3: par3, par4: par4, par5: par5)))%"
        secondCorrection.text = "\(NSString(format: "%.2f", formula.second(par1: par1, par2: par2, par3: par3, par4: par4, par5: par5)))%"
        thirdCorrection.text = "\(NSString(format: "%.2f", formula.third(par1: par1, par2: par2, par3: par3, par4: par4, par5: par5)))%"
        view.endEditing(true)
    }
    
}
