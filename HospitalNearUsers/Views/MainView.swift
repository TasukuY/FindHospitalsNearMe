//
//  ContentView.swift
//  HospitalNearUsers
//
//  Created by Tasuku Yamamoto on 7/28/22.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    MapView()
                } label: {
                    Text("See the Map")
                        .frame(width: UIScreen.main.bounds.width - 30, height: 45, alignment: .center)
                        .background(colorScheme == .dark ? Color.white : Color.black)
                        .font(.system(size: 18, weight: .bold))
                        .cornerRadius(10)
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
