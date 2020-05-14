//
//  UIView+Extension.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 19/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

extension UIView {
    func addAllSubviews(views: [UIView]) {
        for everyView in views {
            self.addSubview(everyView)
        }
    }
}
