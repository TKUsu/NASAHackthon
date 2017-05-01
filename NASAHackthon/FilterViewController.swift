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
    var type: String! = "all"
    var result = Dictionary<String, Any>()
    
    var FilterSwitch1 : UISwitch!
    var FilterSwitch2 : UISwitch!
    var FilterSwitch3 : UISwitch!
    var AllSwitch : UISwitch!
    var FilterLabel:UILabel!
    var FilterLebleText1 : UILabel!
    var FilterLebleText2 : UILabel!
    var FilterLebleText3 : UILabel!
    var AllLabel :UILabel!
    var mySet: Set<Int> = Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//跳頁
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ok", style: .plain, target: self, action: #selector(okAction))
//Switch Object
        FilterSwitch1 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch1.onTintColor = UIColor.green
        
        view.addSubview(FilterSwitch1)
        
        FilterSwitch2 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch2.onTintColor = UIColor.green
        
        view.addSubview(FilterSwitch2)
        
        FilterSwitch3 = UISwitch(frame:CGRect(x: 0, y: 0, width: 150, height: 100))
        FilterSwitch3.onTintColor = UIColor.green

        view.addSubview(FilterSwitch3)
        
        AllSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        AllSwitch.onTintColor = UIColor.green
        AllSwitch.addTarget(self, action: #selector(AllSwitchd), for: .allEvents)
        
        view.addSubview(AllSwitch)
        
//Switch Limit
        self.FilterSwitch1.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint1 = NSLayoutConstraint(item: FilterSwitch1, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 140.0)
        
        self.FilterSwitch2.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint2 = NSLayoutConstraint(item: FilterSwitch2, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 210.0)
        
        self.FilterSwitch3.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint3 = NSLayoutConstraint(item: FilterSwitch3, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 280.0)
        
        self.AllSwitch.translatesAutoresizingMaskIntoConstraints = false
        let setting_switchConstraint4 = NSLayoutConstraint(item: AllSwitch, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 80.0)
        let setting_verConstraint4 = NSLayoutConstraint(item: AllSwitch, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 350.0)
        
        
        view.addConstraints([setting_verConstraint1 , setting_switchConstraint1 , setting_verConstraint2 , setting_switchConstraint2 , setting_switchConstraint3 , setting_verConstraint3 , setting_switchConstraint4 , setting_verConstraint4])
        
//Label Object
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
        
        AllLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 20))
        AllLabel.text = "All";
        AllLabel.tintColor = UIColor.black
        view.addSubview(AllLabel)
        
//Lable Limit
        self.FilterLebleText1.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint1 = NSLayoutConstraint(item: FilterLebleText1, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250.0)
        let setting_YlebelConstraint1 = NSLayoutConstraint(item: FilterLebleText1, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch1, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        
        self.FilterLebleText2.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint2 = NSLayoutConstraint(item: FilterLebleText2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 390.0)
        let setting_YlebelConstraint2 = NSLayoutConstraint(item: FilterLebleText2, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch2, attribute: .trailing, multiplier: 1.0, constant: 10.0)

        self.FilterLebleText3.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint3 = NSLayoutConstraint(item: FilterLebleText3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 530.0)
        let setting_YlebelConstraint3 = NSLayoutConstraint(item: FilterLebleText3, attribute: .leading, relatedBy: .equal, toItem: FilterSwitch3, attribute: .trailing, multiplier: 1.0, constant: 10.0)
        
        
        self.AllLabel.translatesAutoresizingMaskIntoConstraints = false
        let setting_XlebelConstraint4 = NSLayoutConstraint(item: AllLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 670.0)
        let setting_YlebelConstraint4 = NSLayoutConstraint(item: AllLabel, attribute: .leading, relatedBy: .equal, toItem: AllSwitch, attribute: .trailing, multiplier: 1.0, constant: 10.0)

        
        view.addConstraints([setting_XlebelConstraint1 , setting_YlebelConstraint1 ,setting_XlebelConstraint2 , setting_YlebelConstraint2 ,setting_XlebelConstraint3 , setting_YlebelConstraint3 , setting_XlebelConstraint4 ,
            setting_YlebelConstraint4])

        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Return segue: getsetting
    func okAction() {
        var temp_location = CLLocation(latitude: 72, longitude: 100)

        type = checkType()
        url_get(location: temp_location, type: type){
            (result) in
            self.result = result
            print("OK: \(self.result)")
        }
        print("aaaa \(self.result)")
        performSegue(withIdentifier: "getsetting", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getsetting" {
            if let vc = segue.destination as? ViewController{
                vc.result = self.result
                print("vc result: \(vc.result) fv result: \(self.result)")
            }else{
                print(segue.destination)
            }
        }
    }
    
    func checkType() -> String {
        if FilterSwitch1.isOn {
            mySet.insert(1)
        }else{
            mySet.remove(1)
        }
        if FilterSwitch2.isOn {
            mySet.insert(2)
        }else{
            mySet.remove(2)
        }
        if FilterSwitch3.isOn {
            mySet.insert(3)
        }else{
            mySet.remove(3)
        }
        print("",String(describing: mySet))
        return String(describing: mySet)
    }
    
    func AllSwitchd() {
        if AllSwitch.isOn {
            for i in 1...3{
                mySet.insert(i)
            }
            FilterSwitch1.isEnabled = false
            FilterSwitch2.isEnabled = false
            FilterSwitch3.isEnabled = false
            FilterSwitch1.setOn(true, animated: true)
            FilterSwitch2.setOn(true, animated: true)
            FilterSwitch3.setOn(true, animated: true)
        }else{
            FilterSwitch1.isEnabled = true
            FilterSwitch2.isEnabled = true
            FilterSwitch3.isEnabled = true
            FilterSwitch1.setOn(false, animated: true)
            FilterSwitch2.setOn(false, animated: true)
            FilterSwitch3.setOn(false, animated: true)
        }
    }

}
