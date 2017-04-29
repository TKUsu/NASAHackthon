//
//  FilterViewController.swift
//  NASAHackthon
//
//  Created by 謝旭棠 on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class FilterViewController: UIViewController {
    
    var myLocation: CLLocation?
    var FilterSwitch1 : UISwitch!
    var FilterSwitch2 : UISwitch!
    var FilterSwitch3 : UISwitch!
    var FilterLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ok", style: .plain, target: self, action: #selector(okAction))
        
        FilterSwitch1 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch1.thumbTintColor = UIColor.orange
        FilterSwitch1.tintColor = UIColor.blue
        FilterSwitch1.onTintColor = UIColor.brown
        
        view.addSubview(FilterSwitch1)
        
        FilterSwitch2 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch2.thumbTintColor = UIColor.orange
        FilterSwitch2.tintColor = UIColor.blue
        FilterSwitch2.onTintColor = UIColor.brown
        
        view.addSubview(FilterSwitch2)
        
        FilterSwitch3 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch3.thumbTintColor = UIColor.orange
        FilterSwitch3.tintColor = UIColor.blue
        FilterSwitch3.onTintColor = UIColor.brown

        view.addSubview(FilterSwitch3)
        
        self.FilterSwitch1.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 100.0)
        let setting_verConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 130.0)
        
        self.FilterSwitch2.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 100.0)
        let setting_verConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 200.0)
        
        self.FilterSwitch3.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 100.0)
        let setting_verConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 220.0)
        
        
        view.addConstraints([setting_verConstraint1 , setting_switchConstraint1 , setting_verConstraint2 , setting_switchConstraint2 , setting_switchConstraint3 , setting_verConstraint3])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func okAction() {
        
    }
}
