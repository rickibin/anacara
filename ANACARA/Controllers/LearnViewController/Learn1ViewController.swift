//
//  LearnViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn1ViewController: ViewController<Learn1View> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension Learn1ViewController: Learn1ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("close")
    }
    
    func undoButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        screenView.canvasImageView.clear()
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("oke")
    }
    
    
}
