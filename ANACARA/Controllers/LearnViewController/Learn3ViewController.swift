//
//  Learn3ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn3ViewController: ViewController<Learn3View> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension Learn3ViewController: Learn3ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("Close")
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("Ok")
    }
    
    func aButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("a")
    }
    
    func bButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("b")
    }
    
    func cButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("c")
    }
    
    func dButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print("d")
    }
}
