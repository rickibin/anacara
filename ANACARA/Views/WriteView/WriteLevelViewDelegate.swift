//
//  WriteLevelViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol WriteLevelViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func levelButtonTapped(_ view: View, didTapButton button: AnimatingButton)
}
