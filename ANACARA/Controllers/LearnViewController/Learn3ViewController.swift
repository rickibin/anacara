//
//  Learn3ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn3ViewController: ViewController<Learn3View> {
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels1.getFrameIndex() {
            self.currentIndex = currentIndex
        }
    }
}

extension Learn3ViewController: Learn3ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        ExerciseModels1.models[currentIndex].flag = true
        if let nextFrameIndex = ExerciseModels1.getFrameIndex() {
            let vc = ExerciseModels1.models[nextFrameIndex].vc
            navigationController?.pushViewController(vc, animated: true)
        }
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
