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
                    
                }
               }
            }
            .navigationBarTitle(Text("Tender Care Requests"))
                    
            .navigationBarItems(trailing:

            HStack {

                Button("New Request") {
                    self.isModal = true
                }.sheet(isPresented: $isModal, content: {
                    AddCareRequest()
                })
            })
                    
               .alert(isPresented: $showLandingPageAlert) {
                Alert(title: Text("Tender by CareDrum - Health Info and Event Management"), message: Text("Connecting patients and caregivers. View care requests that you requested."), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }

struct CareRequest_Previews: PreviewProvider {
    static var previews: some View {
        CareRequest(careRequests: testData)
    }
}
