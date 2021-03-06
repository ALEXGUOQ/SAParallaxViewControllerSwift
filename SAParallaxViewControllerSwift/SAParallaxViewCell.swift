//
//  SAParallaxViewCell.swift
//  SAParallaxViewControllerSwiftExample
//
//  Created by 鈴木大貴 on 2015/01/30.
//  Copyright (c) 2015年 鈴木大貴. All rights reserved.
//

import UIKit

public class SAParallaxViewCell: UICollectionViewCell {
    
    public var containerView: SAParallaxContainerView!
    
    private var previousImageOffset = CGPoint.zeroPoint
    
    public override init() {
        super.init()
        self.initialize()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    public override func prepareForReuse() {
        containerView.removeFromSuperview()
        self.initialize()
    }
    
    //MARK: - SAParallaxViewCell Private Methods
    private func initialize() {
        self.containerView = SAParallaxContainerView(frame: bounds)
        self.addSubview(self.containerView)
    }
    
    //MARK: - SAParallaxViewCell Public Methods
    public func setImage(image: UIImage) {
        self.containerView.setImage(image)
    }
    
    public func setImageOffset(offset: CGPoint) {
        if selected {
            return
        }
        self.containerView.setImageOffset(offset)
    }
    
    public func screenShot() -> UIImageView {
        let scale = UIScreen.mainScreen().scale
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, scale)
        self.containerView.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView(frame: self.containerView.bounds)
        imageView.image = image
        
        return imageView
    }
}
