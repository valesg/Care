//
//  PatientMonitor.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct PatientMonitor: View {
                @State var showLandingPageAlert = true
                @State var isModal = false
                var allPatientMonitorCandidates: [PatientMonitorRecord] = []

                var body: some View {
                    
                    NavigationView {
                        
                        List(allPatientMonitorCandidates) { singlePatientMonitorCandidate in
                        NavigationLink(destination: PatientMonitorDetail()) {
                        Image(singlePatientMonitorCandidate.thumbnailNameService)
                            .resizable()
                            .cornerRadius(5.0)
                            .frame(width: 150, height: 125)
                            
                        VStack(alignment: .leading) {
                            Text("Patient: \(singlePatientMonitorCandidate.patientName)")
                            .font(.subheadline)
                            Text("What: \(singlePatientMonitorCandidate.requestedService)")
                            .font(.subheadline)
                            Text("Status: GREEN/RED")
                            Text("By: \(singlePatientMonitorCandidate.name) - \(singlePatientMonitorCandidate.caregiverID)")
                            .font(.subheadline)
                            
                            
                        }
                       }
                    }
                    .navigationBarTitle(Text("Being Monitored"))
                            .navigationBarItems(trailing:

                            HStack {

                                Button("Contact Tracing") {
                                    self.isModal = true
                                }.sheet(isPresented: $isModal, content: {
                                    ContactTraceSearch()
                                })
                            })
                            
                            
                       .alert(isPresented: $showLandingPageAlert) {
                        Alert(title: Text("CareDrum - Health Info and Event Management"), message: Text("Proactive Monitoring using real time data and artificial intelligence."), dismissButton: .default(Text("Ok")))
                        }
                    }
                }
}

struct PatientMonitor_Previews: PreviewProvider {
    static var previews: some View {
        PatientMonitor(allPatientMonitorCandidates: patientMonitorTestData)
    }
}
