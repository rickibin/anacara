//
//  Learn1View.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn1View: View {
    
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
        label.text = "Tulisen aksara jawa ngisor iki"
        
        return label
    }()
    
    lazy var learningBoardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "LearningBoard")
        
        return imageView
    }()
    
    lazy var latinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.text = "ha"
        
        return label
    }()
    
    lazy var aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "HanacarakaNormal", size: 90)
        label.text = "a"
        
        return label
    }()
    
    lazy var canvasBoardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "CanvasBoard")
        
        return imageView
    }()
    
    lazy var canvasImageView: CanvasImageView = {
        let canvas = CanvasImageView(frame: .zero)
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        return canvas
    }()
    
    lazy var undoButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "UndoButton"), for: .normal)
        button.setImage(UIImage(named: "UndoButton"), for: .highlighted)
        
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
        
        return button
    }()
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        addAllSubviews(views: [customNavBarView, questionLabel, learningBoardImageView, latinLabel, aksaraLabel, canvasBoardImageView, canvasImageView, undoButton, okButton])
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
            
            learningBoardImageView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 19),
            learningBoardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            learningBoardImageView.widthAnchor.constraint(equalToConstant: 320),
            learningBoardImageView.heightAnchor.constraint(equalToConstant: 238),
            
            latinLabel.topAnchor.constraint(equalTo: learningBoardImageView.topAnchor, constant: 77),
            latinLabel.leftAnchor.constraint(equalTo: learningBoardImageView.leftAnchor, constant: 61),
            
            aksaraLabel.topAnchor.constraint(equalTo: learningBoardImageView.topAnchor, constant: 54),
            aksaraLabel.rightAnchor.constraint(equalTo: learningBoardImageView.rightAnchor, constant: -66),
            
            canvasBoardImageView.topAnchor.constraint(equalTo: learningBoardImageView.bottomAnchor, constant: 20),
            canvasBoardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            canvasBoardImageView.widthAnchor.constraint(equalToConstant: 369),
            canvasBoardImageView.heightAnchor.constraint(equalToConstant: 369),
            
            canvasImageView.centerXAnchor.constraint(equalTo: canvasBoardImageView.centerXAnchor),
            canvasImageView.centerYAnchor.constraint(equalTo: canvasBoardImageView.centerYAnchor),
            canvasImageView.widthAnchor.constraint(equalToConstant: 369),
            canvasImageView.heightAnchor.constraint(equalToConstant: 369),
            
            undoButton.topAnchor.constraint(equalTo: canvasImageView.topAnchor, constant: 9),
            undoButton.leftAnchor.constraint(equalTo: canvasImageView.leftAnchor, constant: 9),
            undoButton.widthAnchor.constraint(equalToConstant: 60),
            undoButton.heightAnchor.constraint(equalToConstant: 60),
            
            okButton.topAnchor.constraint(equalTo: canvasBoardImageView.bottomAnchor, constant: 26),
            okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            okButton.widthAnchor.constraint(equalToConstant: 370),
            okButton.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}
