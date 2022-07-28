//
//  HospitalsListView.swift
//  HospitalNearUsers
//
//  Created by Tasuku Yamamoto on 7/28/22.
//

import SwiftUI
import MapKit

struct HospitalsListView: View {

    @Environment(\.colorScheme) var colorScheme
    let hospitals: [Hospital]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
//            HStack {
//                EmptyView()
//            }
            Text("Click here to see the list of hospitals near you")
            .frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(colorScheme == .dark ? Color.white : Color.black)
            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
            .gesture(TapGesture()
                .onEnded(self.onTap))

            List {
                
                ForEach(self.hospitals, id: \.id) { hospital in
                    VStack(alignment: .leading) {
                        Text(hospital.name)
                            .fontWeight(.bold)
                        
                        Text(hospital.title)
                    }
                }
            }
//            .animation(nil)
        }
        .cornerRadius(10)
    }
}

struct HospitalsListView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsListView(hospitals: [Hospital(placemark: MKPlacemark())], onTap: {})
    }
}
