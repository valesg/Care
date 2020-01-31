//
//  PatientMonitorData.swift
//  Care
//
//  Created by Guy Vales on 2020-01-26.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct PatientMonitorRecord : Identifiable {
    var id = UUID()
    var requestorID: Int
    var patientID: Int
    var patientName: String {return "J Doe" + " \(patientID)" }
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
    var thumbnailNameService: String { return "\(patientID)" + "_Facepatient" }
    }


let patientMonitorTestData = [
    PatientMonitorRecord(requestorID: 1, patientID: 1, caregiverID: 101, requestedServiceCode: 101, requestedService: "GeoLocation", name: "Nurse Yanick", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    PatientMonitorRecord(requestorID: 2, patientID: 2, caregiverID: 105, requestedServiceCode: 102, requestedService: "Heart rate", name: "PSW Lucy", professionalTitle: "PSW", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:40, mapLongitude: -75),
    PatientMonitorRecord(requestorID: 3, patientID: 3, caregiverID: 200, requestedServiceCode: 103, requestedService: "Objects", name: "Nurse Paula", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    PatientMonitorRecord(requestorID: 4, patientID: 4, caregiverID: 198, requestedServiceCode: 104, requestedService: "GeoLocation", name: "Nurse Celine", professionalTitle: "Nurse", address: "Nearby...", caregiverLatitude: 40, caregiverLongitude: -75, hasVideo: true, mapLatitude:37.2, mapLongitude: -75),
    PatientMonitorRecord(requestorID: 5, patientID: 5, caregiverID: 230, requestedServiceCode: 1055, requestedService: "GeoLocation", name: "RNA Katia", professionalTitle: "RNA", address: "Nearby", caregiverLatitude: 37, caregiverLongitude: 23, hasVideo: false, mapLatitude:37.2, mapLongitude: -75),

]
