//
//  CanvasImageView.swift
//  ANACARA
//
//  Created by Ricki Bin Yamin on 19/03/20.
//  Copyright © 2020 Ricki Bin Yamin. All rights reserved.
//

import UIKit

class CanvasImageView: UIImageView {
    
    private var boundingBox: CGRect?
    private var lastPoint = CGPoint.zero
    private var color = UIColor.black
    private var brushWidth: CGFloat = CGFloat(8).makeDynamicW()
    private var opacity: CGFloat = 1.0
    private var swiped = false
    
    var originalImage: UIImage!
    var originalClearImage: UIImage!
    var processedImage: UIImage!
    var processedClearImage: UIImage!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit(){
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swiped = false
        
        guard self.frame.contains(touch.location(in: self.inputView)) else {
            return super.touchesBegan(touches, with: event)
        }
        
        lastPoint = touch.location(in: self)
        if boundingBox == nil {
            boundingBox = CGRect(x: lastPoint.x - brushWidth / 2, y: lastPoint.y - brushWidth / 2, width: brushWidth, height: brushWidth)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard self.frame.contains(touch.location(in: self.inputView)) else {
            swiped = false
            return super.touchesMoved(touches, with: event)
        }
        
        let currentPoint = touch.location(in: self)
        
        if boundingBox == nil {
            boundingBox = CGRect(x: currentPoint.x - brushWidth, y: currentPoint.y - brushWidth, width: brushWidth, height: brushWidth)
        }
        
        if swiped {
            drawLine(from: lastPoint, to: currentPoint)
        }
        else {
            drawLine(from: currentPoint, to: currentPoint)
            swiped = true
        }
        
        if currentPoint.x < boundingBox!.minX {
            stretchBoundingBox(minX: currentPoint.x - brushWidth, maxX: nil, minY: nil, maxY: nil)
            
        }
        else if currentPoint.x > boundingBox!.maxX {
            stretchBoundingBox(minX: nil, maxX: currentPoint.x + brushWidth, minY: nil, maxY: nil)
        }
        
        if currentPoint.y < boundingBox!.minY {
            stretchBoundingBox(minX: nil, maxX: nil, minY: currentPoint.y - brushWidth, maxY: nil)
        }
        else if currentPoint.y > boundingBox!.maxY {
            stretchBoundingBox(minX: nil, maxX: nil, minY: nil, maxY: currentPoint.y + brushWidth)
        }
        
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        if self.frame.contains(touch.location(in: self.inputView)) {
            if !swiped {
                drawLine(from: lastPoint, to: lastPoint)
            }
        }
        processImage()
        super.touchesEnded(touches, with: event)
    }
    
    private func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        self.image?.draw(in: self.bounds)
        
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        context.setLineCap(.round)
        //context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        context.strokePath()
        
        
        originalClearImage = UIGraphicsGetImageFromCurrentImageContext()
        self.image = originalClearImage
        
        let rectangle = CGRect(x: 0, y: 0, width: originalClearImage.size.width, height: originalClearImage.size.height)
        
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(rectangle)
        context.drawPath(using: .fill)
        self.image?.draw(at: CGPoint.zero)
        
        originalImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    private func stretchBoundingBox(minX: CGFloat?, maxX: CGFloat?, minY: CGFloat?, maxY: CGFloat?) {
        guard let box = boundingBox else { return }
        boundingBox = CGRect(x: minX ?? box.minX,
                             y: minY ?? box.minY,
                             width: (maxX ?? box.maxX) - (minX ?? box.minX),
                             height: (maxY ?? box.maxY) - (minY ?? box.minY))
    }
    
    private func processImage() {
        //crop image from the edge
        guard let image = originalClearImage, let box = boundingBox else { return }
        let img = image.cgImage!.cropping(to: box)
        let croppedImage = UIImage(cgImage: img!)
        
        //scale croppedImage to 210x210
        let size = CGSize(width: min(210 * croppedImage.size.width / croppedImage.size.height, 210), height: min(210 * croppedImage.size.height / croppedImage.size.width, 210))
        let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height).integral
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.interpolationQuality = .none
        croppedImage.draw(in: newRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        //add border to 210x210 scaled cropped image, draw it at the center of 299x299 size, so that the image will be 299x299 with 210x210 centered cropped image
        UIGraphicsBeginImageContext(CGSize(width: 299, height: 299))
        guard let context1 = UIGraphicsGetCurrentContext() else { return }
        scaledImage.draw(at: CGPoint(x: (299 - scaledImage.size.width) / 2, y: (299 - scaledImage.size.height) / 2))
        processedClearImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        let rectangle = CGRect(x: 0, y: 0, width: processedClearImage.size.width, height: processedClearImage.size.height)
        context1.setFillColor(UIColor.white.cgColor)
        context1.addRect(rectangle)
        context1.drawPath(using: .fill)
        processedClearImage.draw(at: CGPoint.zero)
        processedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    func clear() {
        self.image = nil
        processedImage = nil
        processedClearImage = nil
        originalImage = nil
        originalClearImage = nil
        boundingBox = nil
    }
    
}
