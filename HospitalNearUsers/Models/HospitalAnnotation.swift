//
//  HospitalAnnotation.swift
//  HospitalNearUsers
//
//  Created by Tasuku Yamamoto on 7/28/22.
//

import Foundation
import MapKit

final class HospitalAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(hospital: Hospital) {
        self.title = hospital.name
        self.coordinate = hospital.coordinate
    }
    
}//End of class
