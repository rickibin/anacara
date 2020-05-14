//
//  HomeViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 16/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class HomeViewController: ViewController<HomeView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
}

extension HomeViewController: HomeViewDelegate {
    func sinauButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        let vc = UINavigationController(rootViewController: LearnLevelViewController())
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func nulisButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        let vc = UINavigationController(rootViewController: WriteLevelViewController())
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
}
