//
//  ExerciseModels1.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class ExerciseModels1 {
    static let models: [ExerciseFrame] = [
        ExerciseFrame(type: .writeExample, exerciseLabel: "ha", trueLabel: "h", choice: nil),
        ExerciseFrame(type: .writeOnly, exerciseLabel: "ha", trueLabel: "h", choice: nil),
        ExerciseFrame(type: .pickAksara, exerciseLabel: "ha", trueLabel: "h", choice: ["k", "h", "r", "n"]),
        ExerciseFrame(type: .pickLatin, exerciseLabel: "h", trueLabel: "ha", choice: ["ca", "ka", "ha"])
    ]
    
    static func nextFrame() -> ComplexFrame? {
        
        for i in 0 ..< models.count {
            let model = models[i]
            if model.flag {
                continue
            }
            else {
                return ComplexFrame(exerciseFrame: model, index: i, totalIndex: models.count)
            }
        }
        
        return nil
    }
    
    struct ComplexFrame {
        var exerciseFrame: ExerciseFrame
        var index: Int
        var totalIndex: Int
    }
}
