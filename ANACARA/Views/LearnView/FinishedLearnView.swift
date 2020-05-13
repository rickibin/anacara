//
//  FinishedLearnView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 13/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class FinishedLearnView: View {
    
    var delegate: FinishedLearnViewDelegate?
    
    lazy var wayangFullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "WayangFull")
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        label.text = "Aksara 1 wis mari"
        
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        label.text = "Ayo terus semangat sinau ing level selanjute"
        
        return label
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
        addAllSubviews(views: [wayangFullImageView, titleLabel, messageLabel, okButton])
        
        NSLayoutConstraint.activate([
            wayangFullImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 265),
            wayangFullImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            wayangFullImageView.widthAnchor.constraint(equalToConstant: 174),
            wayangFullImageView.heightAnchor.constraint(equalToConstant: 235),
            
            titleLabel.topAnchor.constraint(equalTo: wayangFullImageView.bottomAnchor, constant: 77),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -51),
            okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 370),
            okButton.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}

extension FinishedLearnView {
    @objc func okButtonTapped(_ button: AnimatingButton) {
        delegate?.okButtonTapped(self, didTapButton: button)
    }
}
