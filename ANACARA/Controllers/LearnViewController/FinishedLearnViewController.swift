//
//  FinishedLearnViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 13/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class FinishedLearnViewController: ViewController<FinishedLearnView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        
        // Update View
        screenView.titleLabel.text = "Aksara \(ExerciseModels.level) wis mari!"
        
        // Update saved level
        if let currentLevel = UserDefaults.standard.value(forKey: "LearnLevel") as? Int {
            if currentLevel == ExerciseModels.level {
                ExerciseModels.level += 1
                UserDefaults.standard.set(ExerciseModels.level, forKey: "LearnLevel")
            }
        }
    }
}

extension FinishedLearnViewController: FinishedLearnViewDelegate {
    func okButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
