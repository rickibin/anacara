//
//  OnBoardingView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class OnBoardingView: View {
    
    lazy var pathOnboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "PathOnboarding")
        
        return imageView
    }()
    
    lazy var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "TitleText")
        
        return imageView
    }()
    
    lazy var descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DescriptionText")
        
        return imageView
    }()
    
    lazy var wayangImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "WayangSide")
        
        return imageView
    }()
    
    lazy var nextButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nglanjutake", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 189/255, blue: 3/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 34/255, green: 50/255, blue: 87/255, alpha: 1)
        button.layer.cornerRadius = CGFloat(16).makeDynamicW()
        button.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    var delegate: OnBoardingViewDelegate?
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        
        addAllSubviews(views: [pathOnboardingImageView, titleImageView, descriptionImageView, wayangImageView, nextButton])
        
        NSLayoutConstraint.activate([
            pathOnboardingImageView.widthAnchor.constraint(equalToConstant: CGFloat(345).makeDynamicW()),
            pathOnboardingImageView.heightAnchor.constraint(equalToConstant: CGFloat(54).makeDynamicW()),
            pathOnboardingImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(269).makeDynamicH()),
            pathOnboardingImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            titleImageView.widthAnchor.constraint(equalToConstant: CGFloat(216).makeDynamicW()),
            titleImageView.heightAnchor.constraint(equalToConstant: CGFloat(80).makeDynamicW()),
            titleImageView.topAnchor.constraint(equalTo: pathOnboardingImageView.bottomAnchor, constant: CGFloat(53).makeDynamicH()),
            titleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionImageView.widthAnchor.constraint(equalToConstant: CGFloat(312).makeDynamicW()),
            descriptionImageView.heightAnchor.constraint(equalToConstant: CGFloat(80).makeDynamicW()),
            descriptionImageView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: CGFloat(12).makeDynamicH()),
            descriptionImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            wayangImageView.widthAnchor.constraint(equalToConstant: CGFloat(122).makeDynamicW()),
            wayangImageView.heightAnchor.constraint(equalToConstant: CGFloat(207).makeDynamicW()),
            wayangImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            wayangImageView.topAnchor.constraint(equalTo: descriptionImageView.bottomAnchor),
            
            nextButton.widthAnchor.constraint(equalToConstant: CGFloat(351).makeDynamicW()),
            nextButton.heightAnchor.constraint(equalToConstant: CGFloat(52).makeDynamicW()),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat(-71).makeDynamicH()),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
}

extension OnBoardingView {
    @objc func nextButtonTapped(_ button: AnimatingButton) {
        delegate?.nextButtonTapped(self, button: button)
    }
}
