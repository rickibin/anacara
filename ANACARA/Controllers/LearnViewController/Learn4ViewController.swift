//
//  Learn4ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn4ViewController: ViewController<Learn4View> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension Learn4ViewController: Learn4ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("Close")
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("Oke")
    }
    
    func answerButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print(button.tag)
    }
}
