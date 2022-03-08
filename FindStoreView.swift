//
//  FindStoreView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI
import MapKit



struct FindStoreView: View {
    @StateObject var locationManager: LocationManager
    @State var selectedID = 1
    @State var searchTextForMap: String = ""
    @State var delta: Double = 0.14
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CENTER_LAT, longitude: CENTER_LONG), span: MKCoordinateSpan(latitudeDelta: 0.14, longitudeDelta: 0.14))
    @State var mapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)))
    @State var isLoadingLocation: Bool = false
    @Binding var showLocationUnavailable: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Color(CVSRed)
                        SearchBar(text: $searchTextForMap, isLoading: $isLoadingLocation, grayText: "Search for stores by location")
                            .padding()
                    }.frame(height: 40)
                    ZStack {
                        
                        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .none, annotationItems: spots.indices) { spotIndex in
                            MapAnnotation(
                                coordinate: CLLocationCoordinate2D(latitude: spots[spotIndex].lat, longitude: spots[spotIndex].long),
                                content: {
                                    if selectedID == spotIndex + 1 {
                                        Image(systemName: "\(spotIndex + 1).circle.fill")
                                            .font(.system(size: 25, weight: .bold))
                                            .foregroundColor(.red)
                                        
                                    } else {
                                        Image(systemName: "\(spotIndex + 1).circle")
                                            .font(.system(size: 25, weight: .bold))
                                            .foregroundColor(.red)
                                            .onTapGesture {
                                                selectedID = spotIndex + 1
                                                withAnimation {
                                                    region.center = CLLocationCoordinate2D(latitude: spots[spotIndex].lat, longitude: spots[spotIndex].long)
                                                }
                                            }
                                    }
                                }
                            )
                        }.colorScheme(.light)
                        .accentColor(.green)
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Button {
                                    withAnimation {
                                        region.center.longitude = locationManager.location?.longitude ?? CENTER_LONG
                                        region.center.latitude = locationManager.location?.latitude ?? CENTER_LAT
                                    }
                                } label: {
                                    Image(systemName: "record.circle.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Button {
                                    withAnimation {
                                        region.span.latitudeDelta -= 0.05
                                        region.span.longitudeDelta -= 0.05
                                    }
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                Button {
                                    withAnimation {
                                        region.span.latitudeDelta += 0.05
                                        region.span.longitudeDelta += 0.05
                                    }
                                    
                                } label: {
                                    Image(systemName: "minus.circle")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }.padding(.trailing)
                        }
                        
                    }.frame(height: UIScreen.height * 0.28)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Text("\(spots.count) results for")
                                Text(" Nashua, NH")
                                    .bold()
                            }.foregroundColor(.black)
                                .font(.caption)
                                .padding(.leading)
                            ForEach(spots.indices) { spotIndex in
                                Divider()
                                HStack {
                                    
                                    VStack {
                                        if selectedID == spotIndex + 1 {
                                            Image(systemName: "\(spotIndex + 1).circle.fill")
                                                .foregroundColor(.red)
                                                .padding()
                                            
                                        } else {
                                            Image(systemName: "\(spotIndex + 1).circle")
                                                .foregroundColor(.red)
                                                .padding()
                                        }
                                        Spacer()
                                    }
                                    VStack(alignment: .leading) {
                                        Group {
                                            Text("\(spots[spotIndex].streetNumber) \(spots[spotIndex].streetName)")
                                                .bold()
                                                .foregroundColor(.black)
                                                .padding(.vertical)
                                            HStack {
                                                Text("Store hours")
                                                Spacer()
                                                Text("Open until 10:00 PM")
                                            }.foregroundColor(.gray)
                                                .font(.caption)
                                                .padding(.top, 3)
                                            HStack {
                                                Text("Pharmacy hours")
                                                Spacer()
                                                Text("Open until 10:00 PM")
                                            }.font(.caption)
                                                .foregroundColor(.gray)
                                            
                                            Divider()
                                        }.onTapGesture {
                                            selectedID = spotIndex + 1
                                            withAnimation {
                                                region.center = CLLocationCoordinate2D(latitude: spots[spotIndex].lat, longitude: spots[spotIndex].long)
                                            }
                                        }
                                        HStack {
                                            Text("Call \(spots[spotIndex].phone)")
                                                .foregroundColor(Color(CVSRed))
                                                .font(.system(size: 11))
                                                .onTapGesture {
                                                    print("TAAAAAAAAAAP")
                                                    let phone = "tel://"
                                                    let phoneNumberformatted = phone + spots[spotIndex].phone
                                                    guard let url = URL(string: phoneNumberformatted) else { return }
                                                    UIApplication.shared.open(url)
                                                }
                                            
                                            Spacer()
                                            Text("Get Store Details")
                                                .foregroundColor(Color(CVSRed))
                                                .font(.system(size: 11))
                                                .bold()
                                        }
                                    }.padding(.trailing)
                                    
                                }.onTapGesture {
                                    selectedID = spotIndex + 1
                                    withAnimation {
                                        region.center = CLLocationCoordinate2D(latitude: spots[spotIndex].lat, longitude: spots[spotIndex].long)
                                    }
                                    
                                }
                            }.onChange(of: locationManager.locationUpdates, perform: { newValue in
                                spots.sort {
                                    $0.distanceFrom(lat: locationManager.location?.latitude ?? CENTER_LAT, Long: locationManager.location?.longitude ?? CENTER_LONG) < $1.distanceFrom(lat: locationManager.location?.latitude ?? CENTER_LAT, Long: locationManager.location?.longitude ?? CENTER_LONG)
                                }
                            })
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        Text("Store Locator")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            Text("Filterview Not Completed yet").foregroundColor(.green)
                        } label: {
                            Image(systemName: "arrowtriangle.down.fill").foregroundColor(.white)
                        }
                        
                    }
                }
        }.onAppear {
            locationManager.requestAuth()
            locationManager.startUpdatingLocation()
            getLocationForMap()
        }
    }
    func getLocationForMap() {
        locationManager.requestAuth()
        if CLLocationManager.locationServicesEnabled() {
            isLoadingLocation = true
            locationManager.requestLocation()
            DispatchQueue.main.async {
                region.center.longitude = locationManager.location?.longitude ?? CENTER_LONG
                region.center.latitude = locationManager.location?.latitude ?? CENTER_LAT
            }
        } else {
            showLocationUnavailable = true
        }
    }
}


//struct FindStoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        FindStoreView(locationManager: <#T##LocationManager#>, selectedID: <#T##Int#>, searchTextForMap: <#T##String#>, delta: <#T##Double#>, mapItem: <#T##MKMapItem#>, isLoadingLocation: <#T##Bool#>, showLocationUnavailable: <#T##Binding<Bool>#>, viewModel: <#T##MapViewViewModel#>)
//    }
//}
