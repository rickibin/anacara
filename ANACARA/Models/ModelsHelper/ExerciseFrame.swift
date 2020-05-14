//
//  ExerciseFrame.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

struct ExerciseFrame {
    var type: ExerciseType
    var exerciseLabel: String
    var trueLabel: String
    var choice: [String]?
    var vc: UIViewController
    
    init(type: ExerciseType, exerciseLabel: String, trueLabel: String, choice: [String]?) {
        self.type = type
        self.exerciseLabel = exerciseLabel
        self.trueLabel = trueLabel
        switch type {
        case .writeExample:
            self.vc = Learn1ViewController()
        case .writeOnly:
            self.vc = Learn2ViewController()
        case .pickAksara:
            self.vc = Learn3ViewController()
        case .pickLatin:
            self.vc = Learn4ViewController()
        }
    }
}
