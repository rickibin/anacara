//
//  TrainingSetView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 19/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class TrainingSetView: View {
    
    lazy var layoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    lazy var canvasImageView: CanvasImageView = {
        let canvas = CanvasImageView(frame: CGRect.zero)
        canvas.translatesAutoresizingMaskIntoConstraints = false
        
        return canvas
    }()
    
    lazy var resultImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "OkButton"), for: .normal)
        
        return button
    }()
    
    lazy var undoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "UndoButton"), for: .normal)
        
        return button
    }()
    
    var delegate: TrainingSetViewDelegate?
    
    override func setViews() {
        super.setViews()
        backgroundColor = .darkGray
        addAllSubviews(views: [layoutImageView, canvasImageView, resultImageView, okButton, undoButton])
        
        okButton.addTarget(self, action: #selector(okButtonTapped(_:)), for: .touchUpInside)
        undoButton.addTarget(self, action: #selector(undoButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func onViewDidLayoutSubviews() {
        super.onViewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            layoutImageView.widthAnchor.constraint(equalToConstant: 350),
            layoutImageView.heightAnchor.constraint(equalToConstant: 350),
            layoutImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            layoutImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 160),
            
            canvasImageView.widthAnchor.constraint(equalToConstant: 350),
            canvasImageView.heightAnchor.constraint(equalToConstant: 350),
            canvasImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            canvasImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 160),
            
            resultImageView.widthAnchor.constraint(equalToConstant: 350),
            resultImageView.heightAnchor.constraint(equalToConstant: 350),
            resultImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -210),
            
            undoButton.widthAnchor.constraint(equalToConstant: 60),
            undoButton.heightAnchor.constraint(equalToConstant: 60),
            undoButton.leftAnchor.constraint(equalTo: canvasImageView.leftAnchor),
            undoButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            okButton.widthAnchor.constraint(equalToConstant: 60),
            okButton.heightAnchor.constraint(equalToConstant: 60),
            okButton.rightAnchor.constraint(equalTo: canvasImageView.rightAnchor),
            okButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
        ])
    }
}

extension TrainingSetView {
    @objc func okButtonTapped(_ button: UIButton) {
        delegate?.okButtonTapped(self, button: button)
    }
    
    @objc func undoButtonTapped(_ button: UIButton) {
        delegate?.undoButtonTapped(self, button: button)
    }
}
