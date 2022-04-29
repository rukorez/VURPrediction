//
//  InfoViewController.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 27.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var textInfo: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.text = "Расчеты данного приложения являются предварительными и предназначены исключительно в ознакомительных целях.\n\nМомент возникновения рефлюкса закодирован в виде чисел:\n - пассивный ПМР возникающий на 1/3 объема мочевого пузыря – 1;\n - пассивный ПМР возникающий на 2/3 объема – 2;\n - пассивный ПМР возникающий на 3/3 объема – 3;\n - активный ПМР – 4.\n\nПри отсутствии расширения лоханки и мочеточника, кодируется нормальным возрастным значением. В норме у детей раннего возраста, ширина лоханки не превышает 3 мм, у 4-5 летних детей – 5 мм. Средние значения диаметра мочеточника в норме у детей грудного возраста находятся в диапазоне 3-4 мм, возрастом 3-6 лет – 3,6-4,3 мм"
        text.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        setSubviews()
        setConstraints()
    }
    
    private func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textInfo)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }


}

// MARK: Констрейнты

extension InfoViewController {
    private func setConstraints() {
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
                        
            textInfo.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            textInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            textInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

