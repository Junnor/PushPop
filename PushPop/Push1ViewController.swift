//
//  Push1ViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/12.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit
import ObjectiveC

class Push1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
}

//
//extension UIViewController {
//    
//    open override class func initialize() {
//    
//        let any: AnyClass = (UIViewController).self as AnyClass
//        let original = class_getInstanceMethod(any, #selector(viewDidLoad))
//        let switchM = class_getInstanceMethod(any, #selector(viewDidLoaded))
//        method_exchangeImplementations(original, switchM)
//    }
//    
//    func viewDidLoaded() {
//        self.viewDidLoaded()
//        print("\(self) did load")
//    }
//}
