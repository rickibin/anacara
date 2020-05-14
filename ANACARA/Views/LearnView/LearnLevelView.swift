//
//  LearnLevelView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 13/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class LearnLevelView: View {
    
    var delegate: LearnLevelViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(red: 34/255, green: 50/255, blue: 87/255, alpha: 1)
        label.text = "SINAU JAWA"
        
        return label
    }()
    
    lazy var closeButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var level1Button: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "angka1button"), for: .normal)
        button.setImage(UIImage(named: "angka1button"), for: .highlighted)
        button.tag = 0
        button.addTarget(self, action: #selector(levelButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var level1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Aksara 1"
        
        return label
    }()
    
    lazy var level2Button: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "angka2button"), for: .normal)
        button.setImage(UIImage(named: "angka2button"), for: .highlighted)
        button.isEnabled = false
        button.tag = 1
        button.addTarget(self, action: #selector(levelButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var level2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Aksara 2"
        
        return label
    }()

    
    lazy var level3Button: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "angka3button"), for: .normal)
        button.setImage(UIImage(named: "angka3button"), for: .highlighted)
        button.isEnabled = false
        button.tag = 2
        button.addTarget(self, action: #selector(levelButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var level3Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Aksara 3"
        
        return label
    }()

    
    lazy var level4Button: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "angka4button"), for: .normal)
        button.setImage(UIImage(named: "angka4button"), for: .highlighted)
        button.isEnabled = false
        button.tag = 3
        button.addTarget(self, action: #selector(levelButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var level4Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Aksara 4"
        
        return label
    }()

    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        
        addAllSubviews(views: [titleLabel, closeButton, level1Button, level1Label, level2Button, level2Label, level3Button, level3Label, level4Button, level4Label])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            //titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 61),
            closeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 34),
            closeButton.heightAnchor.constraint(equalToConstant: 34),
            
            level1Button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            level1Button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            level1Button.widthAnchor.constraint(equalToConstant: 104),
            level1Button.heightAnchor.constraint(equalToConstant: 104),
            
            level1Label.topAnchor.constraint(equalTo: level1Button.bottomAnchor, constant: -2),
            level1Label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            level2Button.topAnchor.constraint(equalTo: level1Label.bottomAnchor, constant: 25),
            level2Button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            level2Button.widthAnchor.constraint(equalToConstant: 104),
            level2Button.heightAnchor.constraint(equalToConstant: 104),
            
            level2Label.topAnchor.constraint(equalTo: level2Button.bottomAnchor, constant: -2),
            level2Label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            level3Button.topAnchor.constraint(equalTo: level2Label.bottomAnchor, constant: 25),
            level3Button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 54),
            level3Button.widthAnchor.constraint(equalToConstant: 104),
            level3Button.heightAnchor.constraint(equalToConstant: 104),
            
            level3Label.topAnchor.constraint(equalTo: level3Button.bottomAnchor, constant: -2),
            level3Label.centerXAnchor.constraint(equalTo: level3Button.centerXAnchor),
            
            level4Button.topAnchor.constraint(equalTo: level2Label.bottomAnchor, constant: 25),
            level4Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -54),
            level4Button.widthAnchor.constraint(equalToConstant: 104),
            level4Button.heightAnchor.constraint(equalToConstant: 104),
            
            level4Label.topAnchor.constraint(equalTo: level4Button.bottomAnchor, constant: -2),
            level4Label.centerXAnchor.constraint(equalTo: level4Button.centerXAnchor)
        ])
    }
}

extension LearnLevelView {
    @objc func closeButtonTapped(_ button: AnimatingButton) {
        delegate?.closeButtonTapped(self, didTapButton: button)
    }
    
    @objc func levelButtonTapped(_ button: AnimatingButton) {
        delegate?.levelButtonTapped(self, didTapButton: button)
    }
}
