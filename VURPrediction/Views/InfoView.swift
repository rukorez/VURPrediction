//
//  InfoView.swift
//  VURPrediction
//
//  Created by Филипп Степанов on 02.06.2022.
//

import UIKit

final class InfoView: UIView {
    
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    
    private lazy var textInfo: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.text = "Расчеты данного приложения являются предварительными и предназначены исключительно в ознакомительных целях.\n\nМомент возникновения рефлюкса закодирован в виде чисел:\n - пассивный ПМР возникающий на 1/3 объема мочевого пузыря – 1;\n - пассивный ПМР возникающий на 2/3 объема – 2;\n - пассивный ПМР возникающий на 3/3 объема – 3;\n - активный ПМР – 4.\n\nПри отсутствии расширения лоханки и мочеточника, кодируется нормальным возрастным значением. В норме у детей раннего возраста, ширина лоханки не превышает 3 мм, у 4-5 летних детей – 5 мм. Средние значения диаметра мочеточника в норме у детей грудного возраста находятся в диапазоне 3-4 мм, возрастом 3-6 лет – 3,6-4,3 мм\n\n\nБольше информации можно найти в статье журнала имени Г.Н.Сперанского Педиатрия по ссылке:"
        text.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return text
    }()
    
    private lazy var urlButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Статья", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .selected)
        button.addTarget(self, action: #selector(urlAction), for: .touchUpInside)
        return button
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(textInfo)
        contentView.addSubview(urlButton)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func urlAction() {
        let url = URL(string: "https://pediatriajournal.ru/archive?show=387&section=6416")
        if let url = url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

// MARK: - Constraints

extension InfoView {
    
    private func setConstraints() {
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
                        
            textInfo.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            textInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            urlButton.topAnchor.constraint(equalTo: textInfo.bottomAnchor, constant: 10),
            urlButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            urlButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            urlButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
