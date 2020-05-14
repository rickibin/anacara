//
//  Learn1ViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 11/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol Learn1ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func undoButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton)
}
