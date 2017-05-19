//
//  Push1ViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/12.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class Push1ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    let value: CGFloat = 30
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView?.layer.shadowColor = UIColor.red.cgColor
        imageView?.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageView?.layer.shadowOpacity = 0.3
        imageView?.layer.shadowRadius = 30
        

    }
    

}
