//
//  MapViewController.swift
//  UiTableViewController Test 02
//
//  Created by 김종현 on 2018. 5. 30..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var storeMapView: MKMapView!
    var location = ""
    var name = ""
    var tel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location, completionHandler: {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if placemarks != nil {
                let placemark = placemarks![0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.name
                annotation.subtitle = self.tel
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.storeMapView.addAnnotation(annotation)
                    
                    // Set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 700, 700)
                    self.storeMapView.setRegion(region, animated: true)
                    self.storeMapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
        
    }

}
