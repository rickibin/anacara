//
//  ExerciseModelChoices.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class ExerciseModelChoices {
    static var learn1Model: [ExerciseFrame] = [
        ExerciseFrame(type: .writeExample, exerciseLabel: "ha", trueLabel: "a", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "ha", trueLabel: "a", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "ha", trueLabel: "a", choice: ["k", "a", "r", "n"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "a", trueLabel: "ha", choice: ["ca", "ka", "ha"]),
        ExerciseFrame(type: .writeExample, exerciseLabel: "na", trueLabel: "n", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "na", trueLabel: "n", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "na", trueLabel: "n", choice: ["k", "a", "r", "n"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "n", trueLabel: "na", choice: ["ca", "na", "ha"]),
    ]
    
    static var learn2Model: [ExerciseFrame] = [
        ExerciseFrame(type: .writeExample, exerciseLabel: "da", trueLabel: "f", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "da", trueLabel: "f", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "da", trueLabel: "f", choice: ["f", "a", "k", "s"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "f", trueLabel: "da", choice: ["ra", "da", "ha"]),
        ExerciseFrame(type: .writeExample, exerciseLabel: "ta", trueLabel: "t", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "ta", trueLabel: "t", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "ta", trueLabel: "t", choice: ["k", "t", "f", "n"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "t", trueLabel: "ta", choice: ["da", "ha", "ta"]),
    ]
    
    static var write1Model: [ExerciseFrame] = [
        ExerciseFrame(type: .writeMenu, exerciseLabel: "ka", trueLabel: "k", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "ha", trueLabel: "a", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "na", trueLabel: "n", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "ca", trueLabel: "c", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "ra", trueLabel: "r", choice: nil)
    ]
    
    static var write2Model: [ExerciseFrame] = [
        ExerciseFrame(type: .writeMenu, exerciseLabel: "sa", trueLabel: "s", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "da", trueLabel: "f", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "la", trueLabel: "l", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "ta", trueLabel: "t", choice: nil),
        ExerciseFrame(type: .writeMenu, exerciseLabel: "wa", trueLabel: "w", choice: nil)
    ]
}
