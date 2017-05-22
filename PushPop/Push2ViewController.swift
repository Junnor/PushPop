//
//  Push2ViewController.swift
//  PushPop
//
//  Created by Ju on 2017/5/12.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class Push2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor.white
        color.withAlphaComponent(0.1)
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageView = UIImageView(image: UIImage(named: "room"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width * 40/64)
        tableView.tableHeaderView = imageView
        
        titleLabel?.text = "Beast"
        titleLabel?.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if currentBarTintColor != nil {
            let image = UIImage.from(color: currentBarTintColor)
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            self.navigationController?.navigationBar.shadowImage = image
        } else {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    // MARK: - Helper
    private var currentBarTintColor: UIColor!
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("ssss \(offsetY)")

        if offsetY >= 0 {
            
            let alpha = min(offsetY / 64, 1.0)
            let themeColor = UIColor(red: 247/255.0, green: 80/255.0, blue: 120/255.0, alpha: alpha)

            currentBarTintColor = themeColor
            
            let image = UIImage.from(color: themeColor)
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
            self.navigationController?.navigationBar.shadowImage = image
            
            self.titleLabel?.alpha = alpha
            
        } else {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    // MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        
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

