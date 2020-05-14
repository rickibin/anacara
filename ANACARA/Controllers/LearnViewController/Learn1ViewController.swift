//
//  LearnViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class Learn1ViewController: ViewController<Learn1View> {
    
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels1.getFrameIndex() {
            self.currentIndex = currentIndex
        }
    }
}

extension Learn1ViewController: Learn1ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func undoButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        screenView.canvasImageView.clear()
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
//        ExerciseModels1.models[currentIndex].flag = true
//        if let nextFrameIndex = ExerciseModels1.getFrameIndex() {
//            let vc = ExerciseModels1.models[nextFrameIndex].vc
//            navigationController?.pushViewController(vc, animated: true)
//        }
        let model = AksaraJawaModel()
        if let prediction = try? model.prediction(image: screenView.canvasImageView.processedImage.toPixelBuffer()!) {
            print(prediction.classLabel)
        }
    }
    
    
}
