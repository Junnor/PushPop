//
//  CornerButton.swift
//  PushPop
//
//  Created by Ju on 2017/5/23.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

@IBDesignable
class CornerButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.9 { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
}
