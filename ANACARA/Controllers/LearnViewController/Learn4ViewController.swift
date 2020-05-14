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
    var exerciseFrame: ExerciseFrame!
    var selectedChoice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels1.getFrameIndex() {
            self.currentIndex = currentIndex
            self.exerciseFrame = ExerciseModels1.models[currentIndex]
            screenView.progressLabel.text = "\(currentIndex+1)/\(ExerciseModels1.models.count)"
        }
        
        // Updating View
        screenView.aksaraLabel.text = exerciseFrame.exerciseLabel
        screenView.aButton.setTitle(exerciseFrame.choice?[0], for: .normal)
        screenView.bButton.setTitle(exerciseFrame.choice?[1], for: .normal)
        screenView.cButton.setTitle(exerciseFrame.choice?[2], for: .normal)
    }
}

extension Learn4ViewController: Learn4ViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        ExerciseModels1.models[currentIndex].flag = true
        if selectedChoice == exerciseFrame.trueLabel {
            // Condition if the answer is correct
            ExerciseModels1.models[currentIndex].flag = true
            if let nextFrameIndex = ExerciseModels1.getFrameIndex() {
                // Condition if next exercise is exist
                let vc = ExerciseModels1.models[nextFrameIndex].vc
                navigationController?.pushViewController(vc, animated: true)
            }
            else {
                // Condition if next nexercise isn't exist, finish
                let vc = FinishedLearnViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            // Condition if the answer is incorrect
            let ac = UIAlertController(title: "Salah", message: "Coba dieling-eling maneh ngendi kang sesuai", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }
    }
    
    func answerButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        screenView.clearAnswerButtonColor()
        button.layer.borderColor = UIColor(red: 231/255, green: 189/255, blue: 3/255, alpha: 1).cgColor
        button.backgroundColor = UIColor(red: 231/255, green: 189/255, blue: 3/255, alpha: 0.1)
        screenView.okButton.isEnabled = true
        selectedChoice = button.titleLabel?.text
    }
}
