//
//  WriteViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol WriteViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func undoButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton)
}
