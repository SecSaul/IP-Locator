//
//  MapViewController.swift
//  IP Locator
//
//  Created by Saular Raffi on 5/9/19.
//  Copyright © 2019 SaularRaffi. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    var lat : Double = 0
    var long : Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCJs4IwYFUzE5swr5Cg5VzhpOS1cv-Nt0k")
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
}
