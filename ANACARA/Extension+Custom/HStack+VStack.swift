//
//  HStack+VStack.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class HStack: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    func sharedInit() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillProportionally
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeHStack(_ views: [UIView]) {
        for everyView in views {
            self.addArrangedSubview(everyView)
        }
    }
}

class VStack: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    func sharedInit() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillProportionally
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeVStack(_ views: [UIView]) {
        for everyView in views {
            self.addArrangedSubview(everyView)
        }
    }
}
