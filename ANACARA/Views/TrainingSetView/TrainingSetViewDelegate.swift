//
//  TrainingSetViewDelegate.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 19/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

protocol TrainingSetViewDelegate {
    func okButtonTapped(_ view: TrainingSetView, button: UIButton)
    func undoButtonTapped(_ view: TrainingSetView, button: UIButton)
}
