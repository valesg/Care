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
                        Text("Member Id: \(singleOnCallCandidate.caregiverID)")
                        .font(.subheadline)
                        Text("Title: \(singleOnCallCandidate.professionalTitle)")
                        .font(.subheadline)
                        Text("Speciality: \(singleOnCallCandidate.requestedService)")
                        .font(.subheadline)
                        
                    }
                   }
                }
                .navigationBarTitle(Text("My OnCall Group"))
                 .navigationBarItems(trailing:

                            HStack {

                                Button("New group member") {
                                    self.isModal = true
                                }.sheet(isPresented: $isModal, content: {
                                    AddMemberToGroup()
                                })
                            })
                        
                        
                   .alert(isPresented: $showLandingPageAlert) {
                    Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Create and add members to your own groups.  Then, you may send them your care requests (e.g. OnCall group)."), dismissButton: .default(Text("Ok")))
                    }
                }
            }
}


struct OnCallReplacementStaff_Previews: PreviewProvider {
    static var previews: some View {
        OnCallReplacementStaff(allOnCallCandidates: onCallStaffTestData)
    }
}

