//
//  OnCallReplacementStaff.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct OnCallReplacementStaff: View {
            @State var showLandingPageAlert = true
            @State var isModal = false
            var allOnCallCandidates: [OnCallStaffRecord] = []
    //        @ObservedObject var astationProximityDetector = StationProximityDetector()
            
            // let location: CLLocation
            var body: some View {
                
                NavigationView {
                    
                    List(allOnCallCandidates) { singleOnCallCandidate in
                    NavigationLink(destination: OnCallStaffDetail()) {
                    Image(singleOnCallCandidate.thumbnailNameService)
                        .resizable()
                        .cornerRadius(5.0)
                        .frame(width: 150, height: 125)
                        
                    VStack(alignment: .leading) {
                        Text(singleOnCallCandidate.name)
                        Text("Employee Id: \(singleOnCallCandidate.caregiverID)")
                        .font(.subheadline)
                        Text("Title: \(singleOnCallCandidate.professionalTitle)")
                        .font(.subheadline)
                        Text("Speciality: \(singleOnCallCandidate.requestedService)")
                        .font(.subheadline)
//                        Text("Comment: " + "\(singleOnCallCandidate.specialComment)")
                        
                    }
                   }
                }
                .navigationBarTitle(Text("My OnCall Group"))
                 .navigationBarItems(trailing:

                            HStack {
                //                Button(action: {
                //                    AppSettings()
                ////                   CareMakeAnnouncement(myText: "You have clicked on the plus sign. Very good.")
                //                })
                //                {
                //                    Image(systemName: "plus.circle")
                //                }

                                Button("New group member") {
                                    self.isModal = true
                                }.sheet(isPresented: $isModal, content: {
                                    AddMemberToGroup()
                                })
                            })
                        
                        
                   .alert(isPresented: $showLandingPageAlert) {
                    Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Making it easy to reach OnCall staff when an extra hand is needed."), dismissButton: .default(Text("Ok")))
                    }
                }
            }
}


struct OnCallReplacementStaff_Previews: PreviewProvider {
    static var previews: some View {
        OnCallReplacementStaff(allOnCallCandidates: onCallStaffTestData)
    }
}

