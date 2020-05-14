//
//  Learn2View.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn2View: View {
    
    var delegate: Learn2ViewDelegate?
    
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
    
    lazy var wayangSampingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "WayangSamping")
        
        return imageView
    }()
    
    lazy var baloonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Baloon")
        
        return imageView
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Tulis aksara jawa kanggo \"ha\""
        
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
        button.addTarget(self, action: #selector(undoButtonTapped(_:)), for: .touchUpInside)
        
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
        addAllSubviews(views: [customNavBarView, wayangSampingImageView, baloonImageView, questionLabel, canvasBoardImageView, canvasImageView, undoButton, okButton])
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
            
            wayangSampingImageView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 72),
            wayangSampingImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            wayangSampingImageView.widthAnchor.constraint(equalToConstant: 96.94),
            wayangSampingImageView.heightAnchor.constraint(equalToConstant: 151.19),
            
            baloonImageView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 47),
            baloonImageView.leftAnchor.constraint(equalTo: wayangSampingImageView.rightAnchor, constant: 10),
            baloonImageView.widthAnchor.constraint(equalToConstant: 266),
            baloonImageView.heightAnchor.constraint(equalToConstant: 191),
            
            questionLabel.topAnchor.constraint(equalTo: baloonImageView.topAnchor, constant: 10),
            questionLabel.leftAnchor.constraint(equalTo: baloonImageView.leftAnchor, constant: 48),
            questionLabel.rightAnchor.constraint(equalTo: baloonImageView.rightAnchor, constant: -10),
            questionLabel.bottomAnchor.constraint(equalTo: baloonImageView.bottomAnchor, constant: -10),
            
            canvasBoardImageView.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 314),
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

extension Learn2View {
    @objc func closeButtonTapped(_ button: AnimatingButton) {
        delegate?.closeButtonTapped(self, didTapButton: button)
    }
    
    @objc func undoButtonTapped(_ button: AnimatingButton) {
        delegate?.undoButtonTapped(self, didTapButton: button)
    }
    
    @objc func okButtonTapped(_ button: AnimatingButton) {
        delegate?.okButtonTapped(self, didTapButton: button)
    }
}
