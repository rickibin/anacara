//
//  Learn3View.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn3View: View {
    
    var delegate: Learn3ViewDelegate?
    
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
        label.text = "Pilihen aksara kanggo \"ka\""
        
        return label
    }()
    
    lazy var buttonGroupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var aButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "HanacarakaNormal", size: 90)
        button.setTitle("a", for: .normal)
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.tag = 0
        
        return button
    }()
    
    lazy var bButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "HanacarakaNormal", size: 90)
        button.setTitle("k", for: .normal)
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.tag = 1
        
        return button
    }()
    
    lazy var cButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "HanacarakaNormal", size: 90)
        button.setTitle("r", for: .normal)
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.tag = 2
        
        return button
    }()
    
    lazy var dButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "HanacarakaNormal", size: 90)
        button.setTitle("n", for: .normal)
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.tag = 3
        
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
        button.isEnabled = false
        
        return button
    }()
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        addAllSubviews(views: [customNavBarView, questionLabel, buttonGroupView, okButton])
        customNavBarView.addAllSubviews(views: [closeButton, progressLabel])
        buttonGroupView.addAllSubviews(views: [aButton, bButton, cButton, dButton])
        
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
            
            buttonGroupView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 13),
            buttonGroupView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonGroupView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            buttonGroupView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -124),
            
            aButton.topAnchor.constraint(equalTo: buttonGroupView.topAnchor),
            aButton.leftAnchor.constraint(equalTo: buttonGroupView.leftAnchor),
            aButton.widthAnchor.constraint(equalToConstant: 184),
            aButton.heightAnchor.constraint(equalToConstant: 305),
            
            bButton.topAnchor.constraint(equalTo: buttonGroupView.topAnchor),
            bButton.rightAnchor.constraint(equalTo: buttonGroupView.rightAnchor),
            bButton.widthAnchor.constraint(equalToConstant: 184),
            bButton.heightAnchor.constraint(equalToConstant: 305),
            
            cButton.leftAnchor.constraint(equalTo: buttonGroupView.leftAnchor),
            cButton.bottomAnchor.constraint(equalTo: buttonGroupView.bottomAnchor),
            cButton.widthAnchor.constraint(equalToConstant: 184),
            cButton.heightAnchor.constraint(equalToConstant: 305),
            
            dButton.rightAnchor.constraint(equalTo: buttonGroupView.rightAnchor),
            dButton.bottomAnchor.constraint(equalTo: buttonGroupView.bottomAnchor),
            dButton.widthAnchor.constraint(equalToConstant: 184),
            dButton.heightAnchor.constraint(equalToConstant: 305),
            
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -51),
            okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 370),
            okButton.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
    
    func clearAnswerButtonColor() {
        aButton.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        aButton.backgroundColor = .white
        bButton.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        bButton.backgroundColor = .white
        cButton.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        cButton.backgroundColor = .white
        dButton.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        dButton.backgroundColor = .white
    }
}

extension Learn3View {
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
