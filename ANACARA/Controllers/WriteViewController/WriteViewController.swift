//
//  WriteViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class WriteViewController: ViewController<WriteView> {
    
    var currentIndex: Int!
    var exerciseFrame: ExerciseFrame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels.getFrameIndex() {
            self.currentIndex = currentIndex
            self.exerciseFrame = ExerciseModels.models[currentIndex]
            screenView.progressLabel.text = "\(currentIndex+1)/\(ExerciseModels.models.count)"
        }
        
        // Updating view
        screenView.questionLabel.text = "Tulis aksara jawa kanggo \"\(exerciseFrame.exerciseLabel)\""
    }
}

extension WriteViewController: WriteViewDelegate {
    
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func undoButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        screenView.canvasImageView.clear()
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        // Checking if canvas has value
        if let canvasResult = screenView.canvasImageView.processedImage {
            // Condition if canvas has value
            let model = AksaraJawaModel()
            if let prediction = try? model.prediction(image: canvasResult.toPixelBuffer()!) {
                print(prediction.classLabel)
                if prediction.classLabel == exerciseFrame.trueLabel {
                    // Condition if prediction match the correct value
                    ExerciseModels.trueCount += 1
                    
                    let ac = UIAlertController(title: "Bener", message: "Sinaumu kasil, tulisanmu bener!", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        ExerciseModels.models[self.currentIndex].flag = true
                        if let nextFrameIndex = ExerciseModels.getFrameIndex() {
                            // Condition if next exercise is exist
                            let vc = ExerciseModels.models[nextFrameIndex].vc
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        else {
                            // Condition if next exercise is not exist, so finish the learning process
                            let vc = FinishedWriteViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }))
                    self.present(ac, animated: true, completion: nil)
                }
                else {
                    // Condition if prediction incorrect
                    let ac = UIAlertController(title: "Salah", message: "Mungkin tulisanmu kurang apik utawa kurang cocok, sampeyan perlu sinau maneh!", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        ExerciseModels.models[self.currentIndex].flag = true
                        if let nextFrameIndex = ExerciseModels.getFrameIndex() {
                            // Condition if next exercise is exist
                            let vc = ExerciseModels.models[nextFrameIndex].vc
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        else {
                            // Condition if next exercise is not exist, so finish the learning process
                            let vc = FinishedWriteViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }))
                    self.present(ac, animated: true, completion: nil)
                }
                
            }
        }
        else {
            // Condition when canvas is empty
            let ac = UIAlertController(title: "Kosong!", message: "Durung ono tulisan ing panggon kang disediaake", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }
}
