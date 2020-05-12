//
//  Learn4ViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol Learn4ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton)
    func answerButtonTapped(_ view: View, didTapButton button: AnimatingButton)
}
