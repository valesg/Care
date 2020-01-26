//
//  CareRequest.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct CareRequest: View {
        @State var showLandingPageAlert = true
        var careRequests: [CareRequestRecord] = []
//        @ObservedObject var astationProximityDetector = StationProximityDetector()
        
        // let location: CLLocation
        var body: some View {
            
            NavigationView {
                
                List(careRequests) { careRequest in
                NavigationLink(destination: CareRequestDetail(careRequest: careRequest)) {
                Image(careRequest.thumbnailNameService)
                    .resizable()
                    .cornerRadius(5.0)
                    .frame(width: 150, height: 125)
                    
                VStack(alignment: .leading) {
                    Text(careRequest.name)
//                    Text("Patient Id: \(careRequest.patientID)")
                    .font(.subheadline)
//                    Text("Requestor Id: \(careRequest.requestorID)")
                    .font(.subheadline)
                    Text("Service: \(careRequest.requestedService)")
                    .font(.subheadline)
                    Text("When: \(careRequest.when)")
                    .font(.subheadline)
                    Text("Where: \(careRequest.requestorID) Riverside")
                    .font(.subheadline)
                    Text("Ottawa, Ontario")
//                    Text("Comment: " + "\(careRequest.specialComment)")
//                    Text("Loc: " + "\(careRequest.stationlatitude)" + ", \(careRequest.stationlongitude) " + "\(self.astationProximityDetector.shortestDistance)")
                    .font(.subheadline)
                    
                }
               }
            }
            .navigationBarTitle(Text("My Care Requests"))
            // .navigationBarItems(leading:
            //    HStack {
                
            //        NavigationLink(destination: Following()) {
            //            Text("Nearest @ " + "\(self.astationProximityDetector.distanceFromStation) km")
                    
            //        }
                    
                    // Button("About") {
                    //    print("About Tapped")
                    // }

            //    })
               .alert(isPresented: $showLandingPageAlert) {
                Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Connecting patients and caregivers."), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }

struct CareRequest_Previews: PreviewProvider {
    static var previews: some View {
        CareRequest(careRequests: testData)
    }
}
