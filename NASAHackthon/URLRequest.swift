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
    let url: String = "http://10.20.8.124/speaceapp/API/get_local_info.php"
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
            if let response_result = response.result.value {
//                print("Result data: \(response_result)")
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
                let result_json = response_result as? [[String: Any]]
                print("result_json: \(result_json)")
                var result_array: [Dictionary<String, Any>]! = [["":""]]
                print("result_array: \(result_array)")
                for i in 0 ..< result_json!.count{
                    let dic = result_json![i] as! Dictionary<String, Any> ;
                    result_array.append(dic)
                    print("( \(i) )foreach result:", dic) ;
                    
                    if let alt = dic["latitude"] as? Double {
                        print("alt: \(alt)")
                    }

                }
                result = result_array[0] as! Dictionary
                let temp = result.index(forKey: "altitude")
                //                result = temp[0] as! Dictionary<String, Any>
                print("=================================\(result.index(forKey: "local_id"))=========\(temp)")
//
//                if let result_json = result_data as? [[String: Any]] {
//                    print("\(result_json)")
//                    for j in 0 ..< result_array.count{
//                        let result_array =
//                        let res#0	0x000000010d44c87e in (url_get(location : CLLocation, type : String, callback : ([String : Any]) -> ()) -> ()).(closure #1) at /Users/sujustin/Code/Hankthon/NASAHackthon/NASAHackthon/URLRequest.swift:79
//ult_KeyValue = result_array[j].flatMap{$0}
////                      print("Get result \(result_KeyValue) end index: \(result_KeyValue.endIndex)")
//                    
//                        for i in 0 ..< result_KeyValue.endIndex{
//                            result.updateValue(result_KeyValue[i].value, forKey: result_KeyValue[i].key)
//                            print("result add \(result_KeyValue[i].key): \(result_KeyValue[i].value)")
//                        }
                        callback(result)
//                    }
//                }
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
    let url: String = "http://10.20.8.124/speaceapp/API/"
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
