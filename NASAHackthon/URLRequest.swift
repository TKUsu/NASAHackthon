//
//  URLRequest.swift
//  NASAHackthon
//
//  Created by sujustin on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

func url_get(location: CLLocation, type: String, callback: @escaping ((_ Result: Dictionary<String, Any>) -> Void)){
    var json: String?
    let url: String = "http://10.20.12.246/speaceapp/API/get_local_info.php"
    var parameters: Parameters?
    
    if type == "0" {
        parameters = ["access_key": "1qaz2wsx",
                      "lat": location.coordinate.latitude,
                      "long": location.coordinate.longitude]
    }else{
        parameters = ["access_key": "1qaz2wsx",
                      "lat": location.coordinate.latitude,
                      "long": location.coordinate.longitude,
                      "type": type]
    }
    
    Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
        .responseJSON { response in
            /* .response
             response.request -> original URL request
             response.response -> URL response
             response.result.value -> result of response serialization data
             Problem: result data could been [[serialization Json]], so should been flatMap
            */
            var result = Dictionary<String, Any>()
            if let result_data = response.result.value {
//                print("Result data: \(result_data)")
//                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("url request success: \(status)")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result_array = result_data as? [[String: Any]] {
                    let result_KeyValue = result_array.flatMap{$0}
//                    print("Get result \(result_KeyValue) end index: \(result_KeyValue.endIndex)")
                    
                    for i in 0 ..< result_KeyValue.endIndex{
                        result.updateValue(result_KeyValue[i].value, forKey: result_KeyValue[i].key)
                        print("result add \(result_KeyValue[i].key): \(result_KeyValue[i].value)")
                    }
                    callback(result)
                    print("insert \(result)")
                }

            }
        }
    /*  Alamofire url get other response function
        .responseString { response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
        }
        .responseData { response in
            debugPrint("All Response Info: \(response)")
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        .response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
     */
}

func url_get(data_id: String){
    var json: String?
    let url: String = "http://10.20.12.246/speaceapp/API/"
    let parameters: Parameters = ["access_key": "1qaz2wsx",
                                  "data_id": data_id]
    
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
}

/*
 [{"local_id":"1",
    "timestemp":"2017-04-29 21:35:39",
        "type_id":"1",
            "data_id":"1",
                "latitude":"100.430462",
                    "longitude":"72.0276249",
                        "altitude":"0",
                            "area_code":"",
                                "multi_zone":""}]
 */
