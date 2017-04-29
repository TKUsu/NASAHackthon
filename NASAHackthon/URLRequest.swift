//
//  URLRequest.swift
//  NASAHackthon
//
//  Created by sujustin on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import Foundation
import Alamofire

func url_get(){
    let parameters: Parameters = ["access_key": "1qaz2wsx"]
    var json: String?
    let url: String = "http://10.20.12.246/speaceapp/API/get_local_info.php"
    
    Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
        .responseJSON { response in
            print(response.request as Any)  // original URL request
            print(response.response as Any) // URL response
            print(response.result.value as Any)   // result of response serialization
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            json = response.result.value as! String?
        }
    
//    Alamofire.request("https://httpbin.org/get").responseJSON { response in
//        print(response.request)  // original URL request
//        print(response.response) // HTTP URL response
//        print(response.data)     // server data
//        print(response.result)   // result of response serialization
//        
//        if let JSON = response.result.value {
//            print("JSON: \(JSON)")
//        }
//    }
    
    return
}
