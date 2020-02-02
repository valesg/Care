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
        @State var isModal = false
    
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
                    
                    Text("Service: \(careRequest.requestedService)")
                    .font(.subheadline)
                    Text("When: \(careRequest.when)")
                    .font(.subheadline)
                    Text("Where: \(careRequest.requestorID) Riverside")
                    .font(.subheadline)
                    Text("Ottawa, Ontario")
                    .font(.subheadline)
                    Text("Requestor Id: \(careRequest.requestorID)")
                    .font(.subheadline)
//                    Text("Comment: " + "\(careRequest.specialComment)")
//                    Text("Loc: " + "\(careRequest.stationlatitude)" + ", \(careRequest.stationlongitude) " + "\(self.astationProximityDetector.shortestDistance)")
                    .font(.subheadline)
                    
                }
               }
            }
            .navigationBarTitle(Text("My Care Requests"))
                    
            .navigationBarItems(trailing:

            HStack {
//                Button(action: {
//                    AppSettings()
////                   CareMakeAnnouncement(myText: "You have clicked on the plus sign. Very good.")
//                })
//                {
//                    Image(systemName: "plus.circle")
//                }

                Button("New Request") {
                    self.isModal = true
                }.sheet(isPresented: $isModal, content: {
                    AddCareRequest()
                })
            })
                    
               .alert(isPresented: $showLandingPageAlert) {
                Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Connecting patients and caregivers. View care requests assigned to you or that you requested."), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }

struct CareRequest_Previews: PreviewProvider {
    static var previews: some View {
        CareRequest(careRequests: testData)
    }
}
