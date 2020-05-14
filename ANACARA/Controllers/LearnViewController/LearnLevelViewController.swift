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
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

extension LearnLevelViewController: LearnLevelViewDelegate {
    func closeButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func levelButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        if let nextFrameIndex = ExerciseModels1.getFrameIndex() {
            let vc = ExerciseModels1.models[nextFrameIndex].vc
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
