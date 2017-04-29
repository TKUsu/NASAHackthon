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

let fullScreenSize = UIScreen.main

class FilterViewController: UIViewController {
    
<<<<<<< Updated upstream
    var myLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ok", style: .plain, target: self, action: #selector(okAction))
=======
    var FilterSwitch : UISwitch!
    var FilterLabel:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        FilterSwitch.thumbTintColor = UIColor.orange
        FilterSwitch.tintColor = UIColor.blue
        FilterSwitch.onTintColor = UIColor.brown
        
        FilterSwitch.addTarget(self, action: "switchChanged", for: UIControlEvents.valueChanged)
        
//        (self, action: Selector(ViewController.onChange) , forControlEvents:.ValueChanged);)
//        
        let
        FilterSwitch.center = CGPoint(x : fullScreenSize 0.5 , y : fullScreenSize  0.5)
        
        // Do any additional setup after loading the view.
>>>>>>> Stashed changes
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func okAction() {
        
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
