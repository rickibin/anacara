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
        //button.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
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
    
    lazy var vStack: VStack = {
        let stack = VStack()
        stack.backgroundColor = .blue
        stack.spacing = 10
        
        return stack
    }()
    
    lazy var hStackTop: HStack = {
        let stack = HStack()
        stack.spacing = 10
        
        return stack
    }()
    
    lazy var hStackBottom: HStack = {
        let stack = HStack()
        stack.spacing = 10
        
        return stack
    }()
    
    lazy var aButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = .brown
        
        return button
    }()
    
    lazy var bButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = .brown
        
        return button
    }()
    
    lazy var cButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = .brown
        
        return button
    }()
    
    lazy var dButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15
        button.backgroundColor = .brown
        
        return button
    }()
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        addAllSubviews(views: [customNavBarView, questionLabel, vStack])
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
            
            vStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 13),
            vStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            vStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -124),
        ])
        
        vStack.makeVStack([hStackTop, hStackBottom])
        hStackTop.makeHStack([aButton, bButton])
        hStackBottom.makeHStack([cButton, dButton])
    }
}
