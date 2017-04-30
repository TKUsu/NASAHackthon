//
//  ViewController.swift
//  NASAHackthon
//
//  Created by sujustin on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import Alamofire

class ViewController: UIViewController  {
    
    var result = Dictionary<String, Any>()
  //  UIColor(patternImage: UIImage(cgImage: #imageLiteral(resourceName: "location") as! CGImage))

    var locationButton: UIButton!
    var settingButton: UIButton!
    
    var mapView: GMSMapView!
    var mylocation: CLLocation!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        startLocaitonManager()
        
        locationButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        locationButton.setImage(#imageLiteral(resourceName: "location"), for: .normal)
       
        locationButton.addTarget(self, action: #selector(locationButtonAction), for: .touchUpInside)
        
        settingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        settingButton.setImage(#imageLiteral(resourceName: "setting"), for: .normal)
        //settingButton.backgroundColor = UIColor(patternImage: UIImage(cgImage: #imageLiteral(resourceName: "setting") as! CGImage))
        settingButton.addTarget(self, action: #selector(settingButtonAction), for: .touchUpInside)
        
        self.view.addSubview(locationButton)
        self.view.addSubview(settingButton)
        
        self.settingButton.translatesAutoresizingMaskIntoConstraints = false
        let setting_horConstraint = NSLayoutConstraint(item: settingButton!, attribute: .trailing, relatedBy: .equal,
                                                       toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
        
        let setting_verConstraint = NSLayoutConstraint(item: settingButton!, attribute: .bottom, relatedBy: .equal,
                                                       toItem: view, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        
        self.locationButton.translatesAutoresizingMaskIntoConstraints = false
        let location_horConstraint = NSLayoutConstraint(item: locationButton!, attribute: .trailing, relatedBy: .equal,
                                               toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
        
        let location_verConstraint = NSLayoutConstraint(item: locationButton!, attribute: .bottom, relatedBy: .equal,
                                               toItem: settingButton, attribute: .top, multiplier: 1.0, constant: -10.0)
        
        view.addConstraints([setting_horConstraint, setting_verConstraint, location_horConstraint, location_verConstraint])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func settingButtonAction(sender: UIButton!) {
        /*  custom to present to other view
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController")
            present(vc!, animated: true, completion: nil)
            =============================================================*/
        performSegue(withIdentifier: "showSetting", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSetting" {
            if let filterView = segue.destination as? FilterViewController{
//                guard mylocation.coordinate.latitude else {
//                    let alert = UIAlertController(title: "Location", message: "Your location isn't found", preferredStyle: .actionSheet)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//                    return
//                }
                filterView.myLocation = self.mylocation
            }else{
                print(segue.destination)
            }
        }
    }
}

//Google Map
extension ViewController: CLLocationManagerDelegate{
    func startLocaitonManager() {
        self.locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let map = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        map.isMyLocationEnabled = true
        
        self.mylocation = map.myLocation
        self.mapView = map
        
        view = map
        
        // Creates a marker in the center of the map.
        //        let marker = GMSMarker()
        //        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        //        marker.title = "Sydney"
        //        marker.snippet = "Australia"
        //        marker.map = mapView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mylocation = locations.last
        myCamera()
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationButtonAction(sender: UIButton!){
        print("My Location: \(mylocation)")
        locationManager.startUpdatingLocation()
        myCamera()
        
        var alert = UIAlertController(title: "Request data", message: "\(result)", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print("\(result)")
    }
    
    func myCamera() {
        let camera = GMSCameraPosition.camera(withLatitude: (mylocation!.coordinate.latitude), longitude: (mylocation!.coordinate.longitude), zoom: 17.0)
        self.mapView?.animate(to: camera)
    }
}

