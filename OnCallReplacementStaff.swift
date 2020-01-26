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
                .navigationBarTitle(Text("OnCall Search Result"))
                   .alert(isPresented: $showLandingPageAlert) {
                    Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Making it easy to reach OnCall staff when an extra hand is needed."), dismissButton: .default(Text("Ok")))
                    }
                }
            }
        

struct OnCallReplacementStaff_Previews: PreviewProvider {
    static var previews: some View {
        OnCallReplacementStaff(allOnCallCandidates: onCallStaffTestData)
    }
}
}
