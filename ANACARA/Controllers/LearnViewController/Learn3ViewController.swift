//
//  Learn3ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 30/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit
import AVFoundation

class Learn3ViewController: ViewController<Learn3View> {
    
    var player: AVAudioPlayer?
    
    var currentIndex: Int!
    var exerciseFrame: ExerciseFrame!
    var selectedChoice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        if let currentIndex = ExerciseModels.getFrameIndex() {
            self.currentIndex = currentIndex
            self.exerciseFrame = ExerciseModels.models[currentIndex]
            screenView.progressLabel.text = "\(currentIndex+1)/\(ExerciseModels.models.count)"
        }
        
        // Updating View
        screenView.questionLabel.text = "Pilihen aksara kanggo \"\(exerciseFrame.exerciseLabel)\""
        screenView.aButton.setTitle(exerciseFrame.choice?[0], for: .normal)
        screenView.bButton.setTitle(exerciseFrame.choice?[1], for: .normal)
        screenView.cButton.setTitle(exerciseFrame.choice?[2], for: .normal)
        screenView.dButton.setTitle(exerciseFrame.choice?[3], for: .normal)
    }
    
    func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension Learn3ViewController: Learn3ViewDelegate {
    
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        
        if selectedChoice == exerciseFrame.trueLabel {
            // Condition if the answer is correct
            playSound(name: "clap")
            ExerciseModels.models[currentIndex].flag = true
            if let nextFrameIndex = ExerciseModels.getFrameIndex() {
                // Condition if next exercise is exist
                let vc = ExerciseModels.models[nextFrameIndex].vc
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
            playSound(name: "alert")
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
