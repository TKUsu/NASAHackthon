//
//  ViewController.swift
//  NASAHackthon
//
//  Created by sujustin on 2017/4/29.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    var mylocation: CLLocation?
    var locationButton: UIButton!
    var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var view_height = view.frame.height, view_width = view.frame.width
        print("X: \(view_height) y: \(view_width)")
        
        locationButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        locationButton.backgroundColor = UIColor.green
        locationButton.addTarget(self, action: #selector(locationButtonAction), for: .touchUpInside)
        
        settingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 505, height: 50))
        settingButton.backgroundColor = UIColor.red
        settingButton.addTarget(self, action: #selector(settingButtonAction), for: .touchUpInside)
        
        self.view.addSubview(locationButton)
        self.view.addSubview(settingButton)
        
        self.settingButton.translatesAutoresizingMaskIntoConstraints = false
        let setting_horConstraint = NSLayoutConstraint(item: settingButton!, attribute: .trailing, relatedBy: .equal,
                                                       toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
        
        let setting_verConstraint = NSLayoutConstraint(item: settingButton!, attribute: .bottom, relatedBy: .equal,
                                                       toItem: locationButton, attribute: .top, multiplier: 1.0, constant: -10.0)
        
        self.locationButton.translatesAutoresizingMaskIntoConstraints = false
        let location_horConstraint = NSLayoutConstraint(item: locationButton!, attribute: .trailing, relatedBy: .equal,
                                               toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0)
        
        let location_verConstraint = NSLayoutConstraint(item: locationButton!, attribute: .bottom, relatedBy: .equal,
                                               toItem: view, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        
        view.addConstraints([setting_horConstraint, setting_verConstraint, location_horConstraint, location_verConstraint])
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = false
        mapView.delegate = self
        self.mylocation = mapView.myLocation
        
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    func locationButtonAction(sender: UIButton!){
        print("My Location: \(mylocation)")
    }
    
    func settingButtonAction(sender: UIButton!) {
        let vcTarget: UIViewController!
    }

}

