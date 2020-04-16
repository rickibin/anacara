//
//  HomeView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 16/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class HomeView: View {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ANACARA"
        label.textColor = UIColor(red: 34/255, green: 50/255, blue: 87/255, alpha: 1)
        label.font = .systemFont(ofSize: CGFloat(30).makeDynamicW(), weight: .bold)
        
        return label
    }()
    
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        
        addAllSubviews(views: [titleLabel])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(45).makeDynamicH()),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
