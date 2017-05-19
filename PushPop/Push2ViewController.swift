//
//  Push2ViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/12.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class Push2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func unwind(unwindSegue :UIStoryboardSegue){
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.alpha = 0.0
    }

}
