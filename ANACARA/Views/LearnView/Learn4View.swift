//
//  Learn4View.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn4View: View {
    
    var delegate: Learn4ViewDelegate?
    
    lazy var customNavBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var closeButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.text = "1/10"
        
        return label
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.text = "Huruf apa iki?"
        
        return label
    }()
    
    lazy var aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = UIColor(red: 231/255, green: 189/255, blue: 3/255, alpha: 1)
        label.font = UIFont(name: "HanacarakaNormal", size: 90)
        label.textAlignment = .center
        label.layer.cornerRadius = 31
        label.layer.masksToBounds = true
        label.text = "c"
        
        return label
    }()
    
    lazy var aButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ha", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.tag = 0
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var bButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("na", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.tag = 1
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var cButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ca", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.tag = 2
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var okButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lanjut", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(UIColor(red: 231/255, green: 189/255, blue: 3/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 34/255, green: 50/255, blue: 87/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(okButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        addAllSubviews(views: [customNavBarView, questionLabel, aksaraLabel, aButton, bButton, cButton, okButton])
        customNavBarView.addAllSubviews(views: [closeButton, progressLabel])
        
        NSLayoutConstraint.activate([
            customNavBarView.topAnchor.constraint(equalTo: self.topAnchor),
            customNavBarView.leftAnchor.constraint(equalTo: self.leftAnchor),
            customNavBarView.rightAnchor.constraint(equalTo: self.rightAnchor),
            customNavBarView.heightAnchor.constraint(equalToConstant: 95),
            
            closeButton.leftAnchor.constraint(equalTo: customNavBarView.leftAnchor, constant: 33),
            closeButton.bottomAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 0),
            closeButton.widthAnchor.constraint(equalToConstant: 34),
            closeButton.heightAnchor.constraint(equalToConstant: 34),
            
            progressLabel.rightAnchor.constraint(equalTo: customNavBarView.rightAnchor, constant: -39),
            progressLabel.bottomAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: -4),
            
            questionLabel.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 9),
            questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33),
            
            aksaraLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 118),
            aksaraLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            aksaraLabel.widthAnchor.constraint(equalToConstant: 187),
            aksaraLabel.heightAnchor.constraint(equalToConstant: 187),
            
            aButton.topAnchor.constraint(equalTo: aksaraLabel.bottomAnchor, constant: 96),
            aButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            aButton.widthAnchor.constraint(equalToConstant: 370),
            aButton.heightAnchor.constraint(equalToConstant: 41),
            
            bButton.topAnchor.constraint(equalTo: aButton.bottomAnchor, constant: 15),
            bButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bButton.widthAnchor.constraint(equalToConstant: 370),
            bButton.heightAnchor.constraint(equalToConstant: 41),
            
            cButton.topAnchor.constraint(equalTo: bButton.bottomAnchor, constant: 15),
            cButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cButton.widthAnchor.constraint(equalToConstant: 370),
            cButton.heightAnchor.constraint(equalToConstant: 41),
            
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -51),
            okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 370),
            okButton.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}

extension Learn4View {
    @objc func closeButtonTapped(_ button: AnimatingButton) {
        delegate?.closeButtonTapped(self, didTapButton: button)
    }
    
    @objc func okButtonTapped(_ button: AnimatingButton) {
        delegate?.okButtonTapped(self, didTapButton: button)
    }
    
    @objc func answerButtonTapped(_ button: AnimatingButton) {
        delegate?.answerButtonTapped(self, didTapButton: button)
    }
}
