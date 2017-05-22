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
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageView = UIImageView(image: UIImage(named: "room"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width * 40/64)
        tableView.tableHeaderView = imageView
        
        titleLabel?.text = "Room"
        titleLabel?.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !useDefaultImage {
            if currentBarTintColor != nil {
                let image = UIImage.from(color: currentBarTintColor)
                self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
                self.navigationController?.navigationBar.shadowImage = image
            } else {
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.shadowImage = UIImage()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    // MARK: - Helper
    private var useDefaultImage = false
    private var currentBarTintColor: UIColor!
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        print("offset = \(offsetY)")
        
        titleLabel?.isHidden = offsetY > 0 ? false : true

        if offsetY >= 0 {
 
            let alpha = min(offsetY / 64, 1.0)
            self.titleLabel?.alpha = alpha

            let themeColor = UIColor(red: 247/255.0, green: 80/255.0, blue: 120/255.0, alpha: alpha)
            currentBarTintColor = themeColor
    
            if offsetY >= 64 {
                useDefaultImage = true
                self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
                self.navigationController?.navigationBar.shadowImage = nil
            } else {
                useDefaultImage = false
                let image = UIImage.from(color: themeColor)
                self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
                self.navigationController?.navigationBar.shadowImage = image
            }
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

