//
//  AddCareRequest.swift
//  Care
//
//  Created by Guy Vales on 2020-01-26.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI
import AVFoundation

struct AddCareRequest: View {
        @Environment(\.presentationMode) var presentationMode
        var jobTitle = ["Nurse", "PSW", "RNA"]
        var careService = ["As Needed", "Blood Work", "Companionship", "Dressing", "Homemaker", "GeoMonitoring", "Lab Test", "Nutrition", "Other", "Pharmaceutical", "Physical Therapy", "Speech Therapy", "Toiletting", "Transportation", "Vaccination"]
        var licenceIssuer = ["Ontario", "Quebec", "Alberta"]
        var requestRecipient = ["All Qualified", "Group", "Specific Caregiver"]
        var profileType = ["Multiple", "Single"]
        var careGroup = ["OnCall", "Favourite"]
        var rateType = ["Pre-negotiated", "Custom"]
    
        var listeningStation = ["Text"]
        @State var adHocMsg: String = "This is an Ad-hoc message"
        @State private var selectedJobTitle = 0
        @State private var selectedCareService = 0
        @State private var selectedLicenceIssuer = 0
        @State private var selectedRequestRecipient = 0
        @State private var selectedProfile = 0
        @State private var selectedCareGroup = 0
        @State private var selectedRateType = 0
        @State var sayAnnouncement = false
        @State var proposedHourlyRate = 15
        @State var firstName: String = ""
        @State var lastName: String = ""
        @State var caregiverID: String = ""
        @State var patientID: String = ""
        @State var requestorID: String = ""
        @State var licenseId: String = ""
        @State var emailAddress: String = ""
        @State var patientAddress: String = ""
        @State private var when = Date()
        @State var estimatedDuration = 3
        @State var groupName: String = ""
        
        var body: some View {
            NavigationView {
                Form {
                    
                    Section {
                        Picker(selection: $selectedProfile, label: Text("Number of Patients")) {
                        ForEach(0..<profileType.count) {
                        Text(self.profileType[$0])
                                                }
                                            }
                        if self.profileType[selectedProfile] == "Single" {
                            TextField("Patient's MemberID", text: $patientID)
                        }
                    }
                    
                    Section {
                        
                        Picker(selection: $selectedCareService, label: Text("Service(s)")) {
                            ForEach(0..<careService.count) {
                                Text(self.careService[$0])
                            }
                        }
                       
                        Picker(selection: $selectedRateType, label: Text("Rate")) {
                            ForEach(0..<rateType.count) {
                                Text(self.rateType[$0])
                            }
                        }
                        
                        if self.rateType[selectedRateType] == "Custom" {
                        Stepper(value: $proposedHourlyRate, in: 15...150) {
                         Text("Proposed Rate: $\(self.proposedHourlyRate) per hour")
                        }

                        }
                        
                        Picker(selection: $selectedRequestRecipient, label: Text("Send request to")) {
                            ForEach(0..<requestRecipient.count) {
                                Text(self.requestRecipient[$0])
                            }
                        }
                        if self.requestRecipient[selectedRequestRecipient] == "Group" {
                            Picker(selection: $selectedCareGroup, label: Text("Choose group")) {
                                ForEach(0..<careGroup.count) {
                                    Text(self.careGroup[$0])
                                }
                            }
 
                        }
                        if self.requestRecipient[selectedRequestRecipient] == "Specific Caregiver" {
                            TextField("Caregiver's MemberID", text: $caregiverID)
                        }
                        DatePicker("When", selection: $when, in: Date()...)
                        Stepper(value: $estimatedDuration, in: 1...80) {
                         Text("Est. Duration: \(self.estimatedDuration) hour(s)")
                        }
                        TextField("Address", text: $patientAddress)



                        Button(action: {
                         self.sayAnnouncement.toggle()
                        CareMakeAnnouncement(myText: "You have submitted a care request for patient \(self.patientID) regarding \(self.careService[self.selectedCareService]) services. Your request will be forwarded to our care givers.  You will receive a response shortly.")
                                                 })
                            {
                                Text("Submit Care Request")
                            }
                        
                    }
                    
            }.navigationBarTitle("New Request")
                .navigationBarItems(trailing:
                HStack() {
                 Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                     }) {
                       Text("Dismiss")
                     }
                })

        }
    }
    }

    func CareMakeAnnouncement(myText: String) {
        let utterance = AVSpeechUtterance(string: myText)
        utterance.rate = 0.5
        let synthetizer = AVSpeechSynthesizer()
        synthetizer.speak(utterance)
        
    }

struct AddCareRequest_Previews: PreviewProvider {
    static var previews: some View {
        AddCareRequest()
    }
}
