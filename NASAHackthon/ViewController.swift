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
    
    @IBOutlet weak var myMapView: GMSMapView!
    var mylocation: CLLocation?
    var locationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var view_height = view.frame.height, view_width = view.frame.width
        print("X: \(view_height) y: \(view_width)")
        
        locationButton = UIButton(type: .infoDark)
        locationButton.backgroundColor = UIColor.green
        
        self.view.addSubview(locationButton)
        
        let horConstraint = NSLayoutConstraint(item: locationButton!, attribute: .centerX, relatedBy: .equal,
                                               toItem: view, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: locationButton!, attribute: .centerY, relatedBy: .equal,
                                               toItem: view, attribute: .centerY,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: locationButton!, attribute: .width, relatedBy: .equal,
                                               toItem: view, attribute: .width,
                                               multiplier: 0.95, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: locationButton!, attribute: .height, relatedBy: .equal,
                                               toItem: view, attribute: .height,
                                               multiplier: 0.95, constant: 0.0)
        
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
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

}

