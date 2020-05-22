//
//  HomeViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 16/04/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: ViewController<HomeView> {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playSound(name: "background")
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

extension HomeViewController: HomeViewDelegate {
    func sinauButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        playSound(name: "button")
        let vc = UINavigationController(rootViewController: LearnLevelViewController())
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func nulisButtonTapped(_ view: View, didTapButton button: AnimatingButton) {
        playSound(name: "button")
        let vc = UINavigationController(rootViewController: WriteLevelViewController())
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
}
