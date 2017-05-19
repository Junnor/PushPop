//
//  ShadowViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/19.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class ShadowViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var radiusLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var offsetWLabel: UILabel!
    @IBOutlet weak var offsetHLabel: UILabel!
    
    // MARK: Private properties
    private var radius: CGFloat = 0 {
        didSet {
            imageView?.layer.shadowRadius = radius
        }
    }
    
    private var opcacity: Float = 0 {
        didSet {
            imageView?.layer.shadowOpacity = opcacity
        }
    }

    private var offsetWidth: CGFloat = 0 {
        didSet {
            imageView?.layer.shadowOffset.width = offsetWidth
        }
    }

    private var offsetHeight: CGFloat = 0 {
        didSet {
            imageView?.layer.shadowOffset.height = offsetHeight
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rect = imageView.bounds
        let shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 3.0)
        imageView.layer.shadowPath = shadowPath.cgPath
    }
    
    // MARK: - Action
    @IBAction func radiusSliderAction(_ sender: UISlider) {
        radiusLabel?.text = "\(sender.value)"
        radius = CGFloat(sender.value)
    }
    
    @IBAction func opacitySliderAction(_ sender: UISlider) {
        opacityLabel?.text = "\(sender.value)"
        opcacity = sender.value
    }
    
    @IBAction func offsetWSliderAction(_ sender: UISlider) {
        offsetWLabel?.text = "\(sender.value)"
        offsetWidth = CGFloat(sender.value)
    }
    
    @IBAction func offsetHSliderAction(_ sender: UISlider) {
        offsetHLabel?.text = "\(sender.value)"
        offsetHeight = CGFloat(sender.value)
    }
}
