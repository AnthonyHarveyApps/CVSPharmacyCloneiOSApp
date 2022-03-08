//
//  Constants.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/1/22.
//

import SwiftUI

var spots = [  // <-- Dummy Data
    CVSLocation(id: 1, streetNumber: 633, streetName: "Amherst Street", lat: 42.8039879, long: -71.5410741, town: "Nashua", phone: "603-880-6861"),
    CVSLocation(id: 2, streetNumber: 456, streetName: "Daniel Webster Hwy", lat: 42.8637490, long: -71.4939293, town: "Merrimack", phone: "603-424-1120"),
    CVSLocation(id: 3, streetNumber: 242, streetName: "Main Street", lat: 42.7577094, long: -71.4633427, town: "Nashua", phone: "603-886-1786"),
    CVSLocation(id: 4, streetNumber: 46, streetName: "Morgan Road", lat: 42.7794043, long: -71.4447919, town: "Hudson", phone: "603-882-2301")
]

let CVSRed = UIColor(red: 203/255.0, green: 30/255.0, blue: 0/255.0, alpha: 1.000)

let labelBlue = UIColor(red: 32/255.0, green: 105/255.0, blue: 153/255.0, alpha: 1.000)

let CENTER_LAT = 42.7595788
let CENTER_LONG = -71.4919089


extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}


extension String {
    func widthOfString(usingFont font : UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}


extension View {
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from:  nil, for: nil)
    }
}


extension Int: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return self
    }
}


struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 20
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 20
    static let passwordMinLength = 8
    static let passwordMaxLength = 64
}
