//
//  OnCallStaffData.swift
//  Care
//
//  Created by Guy Vales on 2020-01-25.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct OnCallStaffRecord : Identifiable {
    var id = UUID()
    var requestorID: Int
    var caregiverID: Int
    var requestedServiceCode: Int
    var requestedService: String
    var name: String
    var professionalTitle: String
    var address: String
    var caregiverLatitude: Int
    var caregiverLongitude: Int
    var hasVideo: Bool = false
    var mapLatitude: CLLocationDegrees
    var mapLongitude: CLLocationDegrees
    var specialComment: String {return "\(requestorID) pill(s)"}
    var imageName: String { return name }
    var thumbnailNameService: String { return "\(caregiverID)" + "_Facenail" }
    }


let onCallStaffTestData = [
    OnCallStaffRecord(requestorID: 1, caregiverID: 101, requestedServiceCode: 1, requestedService: "Blood Work", name: "Nurse Yanick", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    OnCallStaffRecord(requestorID: 2, caregiverID: 105, requestedServiceCode: 2, requestedService: "Lab Test", name: "Nurse Lucy", professionalTitle: "PSW", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    OnCallStaffRecord(requestorID: 3, caregiverID: 200, requestedServiceCode: 3, requestedService: "Nutrition", name: "Nurse Paula", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    OnCallStaffRecord(requestorID: 4, caregiverID: 198, requestedServiceCode: 4, requestedService: "Pharmaceutical", name: "Nurse Celine", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    OnCallStaffRecord(requestorID: 5, caregiverID: 230, requestedServiceCode: 5, requestedService: "Vaccination", name: "Nurse Katia", professionalTitle: "RNA", address: "Nearby", caregiverLatitude: 37, caregiverLongitude: 23, hasVideo: false, mapLatitude:37.2, mapLongitude: -75),

]
