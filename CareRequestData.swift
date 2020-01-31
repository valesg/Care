//
//  CareRequestData.swift
//  Care
//
//  Created by Guy Vales on 2020-01-25.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct CareRequestRecord : Identifiable {
    var id = UUID()
    var requestorID: Int
    var patientID: Int
    var requestedServiceCode: Int
    var requestedService: String
    var name: String
    var when: String
    var address: String
    var patientLatitude: Int
    var patientLongitude: Int
    var hasVideo: Bool = false
    var mapLatitude: CLLocationDegrees
    var mapLongitude: CLLocationDegrees
    var specialComment: String {return "\(requestorID) pill(s)"}
    var imageName: String { return name }
    var thumbnailNameService: String { return "\(requestedServiceCode)" + "_Thumbnail" }
    }


let testData = [
    CareRequestRecord(requestorID: 1, patientID: 101, requestedServiceCode: 1, requestedService: "Blood Work", name: "Next: Cedric Lochard", when: "Today @ 13:00", address: "Nearby...", patientLatitude: 40, patientLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    CareRequestRecord(requestorID: 2, patientID: 105, requestedServiceCode: 2, requestedService: "Lab Test", name: "Next: Graham Doe", when: "Tomorrow @ 9:00", address: "Nearby...", patientLatitude: 40, patientLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    CareRequestRecord(requestorID: 3, patientID: 200, requestedServiceCode: 3, requestedService: "Nutrition", name: "Done: Melissa Doe", when: "Jan 20 @ 13:00", address: "Nearby...", patientLatitude: 40, patientLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    CareRequestRecord(requestorID: 4, patientID: 198, requestedServiceCode: 4, requestedService: "Pharmaceutical", name: "Done: Jennifer Doe", when: "Jan 19 @ 10:00", address: "Nearby...", patientLatitude: 40, patientLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    CareRequestRecord(requestorID: 5, patientID: 230, requestedServiceCode: 5, requestedService: "Vaccination", name: "Done: Sam Doe", when: "Jan 18 @ 9:30", address: "Nearby", patientLatitude: 37, patientLongitude: 23, hasVideo: false, mapLatitude:37.2, mapLongitude: -75),

]

