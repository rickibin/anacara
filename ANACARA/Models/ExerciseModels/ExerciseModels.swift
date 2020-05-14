//
//  ExerciseModels.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 14/05/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class ExerciseModels {
    static var models: [ExerciseFrame] = []
    static var level = 1
    
    static func getFrameIndex() -> Int? {
        for i in 0 ..< models.count {
            if models[i].flag {
                continue
            }
            else {
                return i
            }
        }
        
        return nil
    }
}
