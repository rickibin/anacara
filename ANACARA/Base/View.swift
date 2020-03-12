//
//  View.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {}
    func layoutViews() {}
    
    func addAllSubviews(views: [UIView]) {
        for everyView in views {
            addSubview(everyView)
        }
    }
}
