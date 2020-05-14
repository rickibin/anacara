//
//  OnBoardingViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class OnBoardingViewController: ViewController<OnBoardingView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension OnBoardingViewController: OnBoardingViewDelegate {
    func nextButtonTapped(_ view: OnBoardingView, button: AnimatingButton) {
        let vc = HomeViewController()
        UserDefaults.standard.set(true, forKey: "OnboardingPassed")
        UserDefaults.standard.set(1, forKey: "LearnLevel")
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
    }
}
