//
//  ContentView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var showLocationUnavailable: Bool = false
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "heart")
                }.tag(1)
            
            ShowCardView()
                .tabItem {
                    Label("Show Card", systemImage: "barcode")
                }.tag(2)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }.tag(3)
            
            FindStoreView(locationManager: locationManager, showLocationUnavailable: $showLocationUnavailable)
                .tabItem {
                    Label("Find Store", systemImage: "mappin")
                }.tag(4)
 
        } .preferredColorScheme(.light)        
        .onAppear {
            UITabBar.appearance().barTintColor = .white
            if #available(iOS 15.0, *) {
             //   UITabBar.appearance().barTintColor = .white
                let appearance = UITabBarAppearance()
                appearance.backgroundColor = .white
                UITabBar.appearance().scrollEdgeAppearance = appearance
                UITabBar.appearance().standardAppearance = appearance
            }
        }
            .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
