//
//  Push2ViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/12.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class Push2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor.white
        color.withAlphaComponent(0.1)
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageView = UIImageView(image: UIImage(named: "demo-header"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width * 0.75)
        tableView.tableHeaderView = imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !useDefaultImage {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    private var useDefaultImage = false
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("ssss \(offsetY)")

        if offsetY >= 0 {
            
            let alpha = min(offsetY / 64, 1.0)
            let themeColor = UIColor(red: 247/255.0, green: 80/255.0, blue: 120/255.0, alpha: alpha)

            let image = UIImage.from(color: themeColor)
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            self.navigationController?.navigationBar.shadowImage = image
            
            if offsetY > 64 {
                useDefaultImage = true
            }
        } else {
            
            useDefaultImage = false
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    // MARK: - DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
        cell.textLabel?.text = "Cell"
        
        return cell
    }

}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

