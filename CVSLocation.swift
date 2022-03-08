//
//  CVSLocation.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/6/22.
//

import Foundation

struct CVSLocation: Codable, Hashable, Identifiable {
    var id: Int
    var streetNumber: Int
    var streetName: String
    var lat: Double
    var long: Double
    var town: String
    var phone: String
    
    func distanceFrom(lat: Double, Long: Double) -> Double {
        let square =  abs(self.lat - lat) * abs(self.lat - lat) + abs(self.long - long) * abs(self.long - long)
        return sqrt(square)
    }
}
