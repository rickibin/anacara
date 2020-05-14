//
//  ExerciseModels1.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class ExerciseModels1 {
    static let model: [ExerciseFrame] = [
        ExerciseFrame(type: .writeExample, exerciseLabel: "ha", trueLabel: "h", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "ha", trueLabel: "h", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "ha", trueLabel: "h", choice: ["k", "h", "r", "n"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "h", trueLabel: "ha", choice: ["ca", "ka", "ha"])
    ]
}
