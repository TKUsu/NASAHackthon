//
//  FilterViewController.swift
//  NASAHackthon
//
//  Created by 謝旭棠 on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit
import CoreLocation

class FilterViewController: UIViewController {
    
    var myLocation: CLLocation?
    var type: String! = "0"
    
    var FilterSwitch1 : UISwitch!
    var FilterSwitch2 : UISwitch!
    var FilterSwitch3 : UISwitch!
    var FilterLabel:UILabel!
    var FilterLebleText1 : UILabel!
    var FilterLebleText2 : UILabel!
    var FilterLebleText3 : UILabel!
    
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
        let setting_switchConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 140.0)
        
        self.FilterSwitch2.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 210.0)
        
        self.FilterSwitch3.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 280.0)
        
        
        view.addConstraints([setting_verConstraint1 , setting_switchConstraint1 , setting_verConstraint2 , setting_switchConstraint2 , setting_switchConstraint3 , setting_verConstraint3])
        
        
        FilterLebleText1 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
        FilterLebleText1.text = "City";
        FilterLebleText1.tintColor = UIColor.black
        view.addSubview(FilterLebleText1)
        
        
        FilterLebleText2 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
        FilterLebleText2.text = "Myths";
        FilterLebleText2.tintColor = UIColor.black
        view.addSubview(FilterLebleText2)
        
        FilterLebleText3 = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
        FilterLebleText3.text = "Endangered Species";
        FilterLebleText3.tintColor = UIColor.black
        view.addSubview(FilterLebleText3)
        
        
        self.FilterLebleText1.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint1 = NSLayoutConstraint(item: FilterLebleText1, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250.0)
        let setting_YlebelConstraint1 = NSLayoutConstraint(item: FilterLebleText1, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch1, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        
        self.FilterLebleText2.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint2 = NSLayoutConstraint(item: FilterLebleText2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 390.0)
        let setting_YlebelConstraint2 = NSLayoutConstraint(item: FilterLebleText2, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch2, attribute: .trailing, multiplier: 1.0, constant: 10.0)

        self.FilterLebleText3.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint3 = NSLayoutConstraint(item: FilterLebleText3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 530.0)
        let setting_YlebelConstraint3 = NSLayoutConstraint(item: FilterLebleText3, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch3, attribute: .trailing, multiplier: 1.0, constant: 10.0)

        
        view.addConstraints([setting_XlebelConstraint1 , setting_YlebelConstraint1 ,setting_XlebelConstraint2 , setting_YlebelConstraint2 ,setting_XlebelConstraint3 , setting_YlebelConstraint3])
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func okAction() {
        url_get(location: myLocation!, type: type)
        self.dismiss(animated: true, completion: {});
    }
}
