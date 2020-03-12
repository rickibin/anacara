//
//  ViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 12/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class ViewController<V: View>: UIViewController {

    override func loadView() {
        view = V()
    }
    
    var screenView: V {
        return view as! V
    }
}
