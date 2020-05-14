//
//  AnimatingButton.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 16/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class AnimatingButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        self.addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.addTarget(self, action: #selector(touchUpAny), for: .touchUpOutside)
        self.addTarget(self, action: #selector(touchUpAny), for: .touchUpInside)
    }
    
    @objc func touchDown() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.98)
        })
    }
    
    @objc func touchUpAny() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}
