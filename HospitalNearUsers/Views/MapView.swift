//
//  MapView.swift
//  HospitalNearUsers
//
//  Created by Tasuku Yamamoto on 7/28/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var locationManager = LocationManager()
    @State private var hospitals: [Hospital] = []
    @State private var tapped: Bool = false
    
    private func getNearByHospitals() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Hospital"
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                let mapItems = response.mapItems
                self.hospitals = mapItems.map {
                    Hospital(placemark: $0.placemark)
                }
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.hospitals.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapViewManager(hospitals: hospitals)
            
            Button {
                self.getNearByHospitals()
            } label: {
                Text("Find Hospitals near you")
                    .padding()
                    .font(.system(size: 14, weight: .bold))
            }
            .background(colorScheme == .dark ? Color.white : Color.black)
            .cornerRadius(10)
            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
            
            HospitalsListView(hospitals: self.hospitals) {
                self.tapped.toggle()
            }
            .animation(.spring(), value: hospitals)
            .offset(y: calculateOffset())
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
