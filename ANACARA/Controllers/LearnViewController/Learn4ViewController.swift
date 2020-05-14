//
//  Learn4ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn4ViewController: ViewController<Learn4View> {
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels1.getFrameIndex() {
            self.currentIndex = currentIndex
        }
    }
}

extension Learn4ViewController: Learn4ViewDelegate {
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
    
    func answerButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        print(button.tag)
    }
}
