//
//  FinishedWriteViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class FinishedWriteViewController: ViewController<FinishedWriteView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        
        // Update View
        screenView.titleLabel.text = "Aksara \(ExerciseModels.level) wis mari!"
        screenView.messageLabel.text = "Sampeyan kasil nulis \(ExerciseModels.trueCount) aksara jawa ing level iki"
        
        // Update saved level
        if let currentLevel = UserDefaults.standard.value(forKey: "WriteLevel") as? Int {
            if currentLevel == ExerciseModels.level {
                ExerciseModels.level += 1
                UserDefaults.standard.set(ExerciseModels.level, forKey: "WriteLevel")
            }
        }
    }
}

extension FinishedWriteViewController: FinishedWriteViewDelegate {
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
