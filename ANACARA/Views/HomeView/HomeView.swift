//
//  HomeView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 16/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class HomeView: View {
    
    var delegate: HomeViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ANACARA"
        label.textColor = UIColor(red: 34/255, green: 50/255, blue: 87/255, alpha: 1)
        label.font = .systemFont(ofSize: CGFloat(30).makeDynamicW(), weight: .bold)
        
        return label
    }()
    
    lazy var sinauJawaButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "SinauJawaButton"), for: .normal)
        button.setImage(UIImage(named: "SinauJawaButton"), for: .highlighted)
        button.addTarget(self, action: #selector(sinauButtonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(sinauButtonHighlighted(_:)), for: .touchDown)
        
        return button
    }()
    
    lazy var nulisJawaButton: AnimatingButton = {
        let button = AnimatingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "NulisJawaButton"), for: .normal)
        button.setImage(UIImage(named: "NulisJawaButton"), for: .highlighted)
        button.addTarget(self, action: #selector(nulisButtonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(nulisButtonHighlighted(_:)), for: .touchDown)
        
        return button
    }()
    
    lazy var wayangImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "WayangHome")
        
        return imageView
    }()
    
    override func setViews() {
        super.setViews()
        backgroundColor = .white
        
        addAllSubviews(views: [titleLabel, sinauJawaButton, nulisJawaButton, wayangImageView])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            sinauJawaButton.widthAnchor.constraint(equalToConstant: CGFloat(367).makeDynamicW()),
            sinauJawaButton.heightAnchor.constraint(equalToConstant: CGFloat(141).makeDynamicW()),
            sinauJawaButton.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(119).makeDynamicH()),
            sinauJawaButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nulisJawaButton.widthAnchor.constraint(equalToConstant: CGFloat(367).makeDynamicW()),
            nulisJawaButton.heightAnchor.constraint(equalToConstant: CGFloat(141).makeDynamicW()),
            nulisJawaButton.topAnchor.constraint(equalTo: sinauJawaButton.bottomAnchor, constant: CGFloat(18).makeDynamicH()),
            nulisJawaButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            wayangImageView.widthAnchor.constraint(equalToConstant: CGFloat(174).makeDynamicW()),
            wayangImageView.heightAnchor.constraint(equalToConstant: CGFloat(226).makeDynamicW()),
            wayangImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wayangImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

extension HomeView {
    @objc func sinauButtonTapped(_ button: AnimatingButton) {
        delegate?.sinauButtonTapped(self, didTapButton: button)
    }
    
    @objc func sinauButtonHighlighted(_ button: AnimatingButton) {
        delegate?.sinauButtonHighlighted(self, didHighlightButton: button)
    }
    
    @objc func nulisButtonTapped(_ button: AnimatingButton) {
        delegate?.nulisButtonTapped(self, didTapButton: button)
    }
    
    @objc func nulisButtonHighlighted(_ button: AnimatingButton) {
        delegate?.nulisButtonHighlighted(self, didHighlightButton: button)
    }
}
