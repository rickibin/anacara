//
//  LearnLevelViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 13/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class LearnLevelViewController: ViewController<LearnLevelView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Viewwillappear")
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        // Updating View
        if let currentLevel = UserDefaults.standard.value(forKey: "LearnLevel") as? Int {
            switch currentLevel {
            case 1:
                screenView.level1Button.isEnabled = true
                screenView.level2Button.isEnabled = false
                screenView.level3Button.isEnabled = false
                screenView.level4Button.isEnabled = false
                break
            case 2:
                screenView.level1Button.isEnabled = true
                screenView.level2Button.isEnabled = true
                screenView.level3Button.isEnabled = false
                screenView.level4Button.isEnabled = false
                break
            case 3:
                screenView.level1Button.isEnabled = true
                screenView.level2Button.isEnabled = true
                screenView.level3Button.isEnabled = true
                screenView.level4Button.isEnabled = false
                break
            case 4:
                screenView.level1Button.isEnabled = true
                screenView.level2Button.isEnabled = true
                screenView.level3Button.isEnabled = true
                screenView.level4Button.isEnabled = true
                break
            default:
                screenView.level1Button.isEnabled = true
                screenView.level2Button.isEnabled = false
                screenView.level3Button.isEnabled = false
                screenView.level4Button.isEnabled = false
                break
            }
        }
    }
}

extension LearnLevelViewController: LearnLevelViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func levelButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        
        switch button.tag {
        case 0:
            ExerciseModels.models = ExerciseModelChoices.learn1Model
            ExerciseModels.level = 1
            break
        case 1:
            ExerciseModels.models = ExerciseModelChoices.learn2Model
            ExerciseModels.level = 2
            break
        default:
            break
        }
        
        if let nextFrameIndex = ExerciseModels.getFrameIndex() {
            let vc = ExerciseModels.models[nextFrameIndex].vc
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
