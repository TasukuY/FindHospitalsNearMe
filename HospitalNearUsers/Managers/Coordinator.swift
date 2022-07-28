//
//  Coordinator.swift
//  HospitalNearUsers
//
//  Created by Tasuku Yamamoto on 7/28/22.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapViewManager
    
    init(_ control: MapViewManager) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate,
                                                    latitudinalMeters: 10000,
                                                    longitudinalMeters: 10000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
        
    }
    
}//End of class
