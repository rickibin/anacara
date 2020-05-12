//
//  Learn3ViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol Learn3ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func aButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func bButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func cButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func dButtonTapped(_ view: View, didTapButton button: AnimatingButton)
}
