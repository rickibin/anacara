//
//  TrainingSetViewController.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 19/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class TrainingSetViewController: ViewController<TrainingSetView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.delegate = self
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save Error!", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Image has been saved to Photos album", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(ac, animated: true, completion: nil)
        }
    }
}

extension TrainingSetViewController: TrainingSetViewDelegate {
    func okButtonTapped(_ view: TrainingSetView, button: UIButton) {
        guard let result = screenView.canvasImageView.processedImage else {
            let ac = UIAlertController(title: "Blank Canvas!", message: "Please write on the canvas!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(ac, animated: true, completion: nil)
            return
        }
        screenView.resultImageView.image = result
        UIImageWriteToSavedPhotosAlbum(result, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        screenView.canvasImageView.clear()
    }
    
    func undoButtonTapped(_ view: TrainingSetView, button: UIButton) {
        screenView.canvasImageView.clear()
    }
    
    
}
