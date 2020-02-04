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
        var announceType = ["Nurse", "PSW", "RNA"]
        var passengerType = ["As Needed", "Blood Work", "Companionship", "Dressing", "Homemaker", "GeoMonitoring", "Lab Test", "Nutrition", "Other", "Pharmaceutical", "Physical Therapy", "Speech Therapy", "Toiletting", "Transportation", "Vaccination"]
        var affectedTrainLine = ["Ontario", "Quebec", "Alberta"]
        var requestRecipient = ["All Qualified", "Group", "Specific Caregiver"]
        var profileType = ["Single", "Multiple"]
        var careGroup = ["OnCall", "Stars"]
        var rateDuration = ["Pre-negotiated", "Custom"]
    
        var listeningStation = ["Text"]
        @State var adHocMsg: String = "This is an Ad-hoc message"
        @State private var selectedAnnounceType = 0
        @State private var selectedPassengerType = 0
        @State private var selectedListeningStation = 0
        @State private var selectedAffectedTrainLine = 0
        @State private var selectedRequestRecipient = 0
        @State private var selectedProfile = 0
        @State private var selectedCareGroup = 0
        @State private var selectedRateDuration = 0
        @State var sayAnnouncement = false
        @State var proposedHourlyRate = 15
        @State var trainLine: String = ""
        @State var lostItem: String = ""
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
                        
                        Picker(selection: $selectedPassengerType, label: Text("Service(s)")) {
                            ForEach(0..<passengerType.count) {
                                Text(self.passengerType[$0])
                            }
                        }
                       
                        Picker(selection: $selectedRateDuration, label: Text("Rate")) {
                            ForEach(0..<rateDuration.count) {
                                Text(self.rateDuration[$0])
                            }
                        }
                        
                        if self.rateDuration[selectedRateDuration] == "Custom" {
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
 
//                             TextField("Choose group (e.g. OnCall)", text: $groupName)
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
                        CareMakeAnnouncement(myText: "You have submitted a care request for patient \(self.patientID) regarding \(self.passengerType[self.selectedPassengerType]) services. Your request will be forwarded to our care givers.  You will receive a response shortly.")
                                                 })
                            {
                                Text("Submit Care Request")
                            }
                        
                    }
                    
                    
                    Section {
                        
                        if self.announceType[selectedAnnounceType] == "Ad-hoc" {
                            Text("What do you want to say?")
                            TextField("Enter your announcement", text: $trainLine)
                            Button(action: {
                                self.sayAnnouncement.toggle()
                                MakeAnnouncement(myText: "Attention, \(self.trainLine)")
                            })
                               {
                                   Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                               }
                    
                        }
                        else if self.announceType[selectedAnnounceType] == "Boarding" {
                                // Text("What Train?")
                                // TextField("Train Line", text: $trainLine)
                                Picker(selection: $selectedAffectedTrainLine, label: Text("Train Line")) {
                                ForEach(0..<affectedTrainLine.count) {
                                    Text(self.affectedTrainLine[$0])
                                    }
                                }
                                Picker(selection: $selectedPassengerType, label: Text("Passenger Type")) {
                                    ForEach(0..<passengerType.count) {
                                        Text(self.passengerType[$0])
                                    }
                                }
                            Text("Msg: Attention, passengers  \(self.passengerType[selectedPassengerType]), please board now")
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                    MakeAnnouncement(myText: "Attention, passengers  \(self.passengerType[self.selectedPassengerType]), please board now")
                                 })
                                    {
                                        Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                    }
                            }
                        else if self.announceType[selectedAnnounceType] == "Departure" {
                                Text("What Trip?")
                                Text("Departure Time?")
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                 })
                                    {
                                        Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                    }
                            }
                        else if self.profileType[selectedProfile] == "Caregiver" {
                            
                            Text("Your Caregiver Info ( \(self.announceType[selectedAnnounceType]) )")
                            Picker(selection: $selectedAnnounceType, label: Text("Caregiver Title")) {
                                ForEach(0..<announceType.count) {
                                    Text(self.announceType[$0])
                                }
                            }
                            
                            if self.announceType[selectedAnnounceType] == "Nurse" {
                                
                            Picker(selection: $selectedAffectedTrainLine, label: Text("Licenced in")) {
                                ForEach(0..<affectedTrainLine.count) {
                                    Text(self.affectedTrainLine[$0])
                                }
                            }
                            Text("License #")
                            TextField("1234567", text: $licenseId)
                            }
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                                 CareMakeAnnouncement(myText: "Congrats, you have been registered as a care giver with a license from \(self.affectedTrainLine[self.selectedAffectedTrainLine]).")
                             })
                                {
                                    Text("Submit Care Request")
                                }
                            
                        }
                        else if self.profileType[selectedProfile] == "Care" {
                             Button(action: {
                                 self.sayAnnouncement.toggle()
                                CareMakeAnnouncement(myText: "You have submitted a care request for patient \(self.patientID) regarding \(self.passengerType[self.selectedPassengerType]) services. Your request will be forwarded to our care givers.  You will receive a response shortly.")
                                                         })
                                    {
                                        Text("Submit Care Request")
                                    }
                                                        
                            }
                        else if self.announceType[selectedAnnounceType] == "Lost & Found" {
                                Text("Found Item(s):")
                                TextField("E.g. Purse, Gloves etc.", text: $lostItem)
                            Text("Msg: \(self.lostItem) have been found. If you are the owner of the item, please go to the information desk")
                            
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                    CareMakeAnnouncement(myText: "\(self.lostItem) have been found. If you are the owner of the item, please go to the information desk")
                                 })
                                    {
                                        Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                    }
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
