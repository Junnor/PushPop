//
//  MainController.swift
//  PushPop
//
//  Created by Ju on 2017/5/20.
//  Copyright © 2017年 Ju. All rights reserved.
//

import UIKit

class MainController: UITableViewController {
    
    private struct SegueIdentifer {
        static let layer = "layer"
        static let pushAndPop = "push and pop"
        
        // customize
        static let segueCount = 2
    }
    
    private enum SegueEnum: Int {
        case layer =  0
        case pushAndPop
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // comfiguratio if needed
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UIBarButtonItem.appearance()
        appearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -100, vertical: -100), for: UIBarMetrics.default)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SegueIdentifer.segueCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        if let segue = SegueEnum(rawValue: indexPath.row) {
            switch segue {
            case .layer:
                cell.textLabel?.text = SegueIdentifer.layer
            case .pushAndPop:
                cell.textLabel?.text = SegueIdentifer.pushAndPop
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let segue = SegueEnum(rawValue: indexPath.row) {
            switch segue {
            case .layer:
                performSegue(withIdentifier: SegueIdentifer.layer, sender: indexPath)
            case .pushAndPop:
                performSegue(withIdentifier: SegueIdentifer.pushAndPop, sender: indexPath)
            }
        }
    }


}
