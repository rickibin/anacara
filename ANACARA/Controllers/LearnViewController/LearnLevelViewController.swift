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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
