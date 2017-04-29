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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(myLocation)
        
        Alamofire.request("http://10.20.8.124/speaceapp/API/get_type_info.php", parameters: ["access_key": "1qaz2wsx"])
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Selete1(_ sender: UISwitch) {
    }
    
    @IBAction func Selete2(_ sender: UISwitch) {
    }
    
    @IBAction func Selete3(_ sender: UISwitch) {
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
