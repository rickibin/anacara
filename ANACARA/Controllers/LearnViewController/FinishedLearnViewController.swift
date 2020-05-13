//
//  FinishedLearnViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 13/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class FinishedLearnViewController: ViewController<FinishedLearnView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension FinishedLearnViewController: FinishedLearnViewDelegate {
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("Yuhu")
    }
}
