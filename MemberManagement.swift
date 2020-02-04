//
//  MemberManagement.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI
import AVFoundation

struct MemberManagement: View {
            @Environment(\.presentationMode) var presentationMode
            var announceType = ["Nurse", "PSW", "RNA"]
            var passengerType = ["with small children", "in First Class", "remaining"]
            var affectedTrainLine = ["Ontario", "Quebec", "Alberta"]
            var profileType = ["Patient", "Caregiver", "Care Manager"]
            var gender = ["Female", "Male"]
            var listeningStation = ["Text"]
            @State var adHocMsg: String = "This is an Ad-hoc message"
            @State private var selectedAnnounceType = 0
            @State private var selectedPassengerType = 0
            @State private var selectedListeningStation = 0
            @State private var selectedAffectedTrainLine = 0
            @State private var selectedProfile = 0
            @State private var selectedGender = 0
            @State var sayAnnouncement = false
            @State var delay = 10
            @State var trainLine: String = ""
            @State var lostItem: String = ""
            @State var firstName: String = ""
            @State var lastName: String = ""
            @State var password: String = ""
            @State var licenseId: String = ""
            @State var emailAddress: String = ""

            
            var body: some View {
                NavigationView {
                    Form {
                        Section {
                            Picker(selection: $selectedProfile, label: Text("Select your Profile")) {
                            ForEach(0..<profileType.count) {
                            Text(self.profileType[$0])
                                                    }
                                                }
                        }
                        Section {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                            TextField("Email", text: $emailAddress)
                            TextField("Choose Password", text:$password)
                            Picker(selection: $selectedGender, label: Text("Gender")) {
                             ForEach(0..<gender.count) {
                             Text(self.gender[$0])
                                                     }
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
                                TextField("License number", text: $licenseId)
                                }
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                     MakeAnnouncement(myText: "Congrats, you have signed up as a care giver with a license from \(self.affectedTrainLine[self.selectedAffectedTrainLine]).")
                                 })
                                    {
                                        Text("Become a CareDrum member")
                                    }
                                
                            }
                            else if self.profileType[selectedProfile] == "Patient" {
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                     MakeAnnouncement(myText: "Congrats, you have signed up as a \(self.profileType[self.selectedProfile]).")
                                                             })
                                        {
                                            Text("Become a CareDrum member")
                                        }
                                                            
                                }
                            else if self.announceType[selectedAnnounceType] == "Lost & Found" {
                                    Text("Found Item(s):")
                                    TextField("E.g. Purse, Gloves etc.", text: $lostItem)
                                Text("Msg: \(self.lostItem) have been found. If you are the owner of the item, please go to the information desk")
                                
                                     Button(action: {
                                         self.sayAnnouncement.toggle()
                                        MakeAnnouncement(myText: "\(self.lostItem) have been found. If you are the owner of the item, please go to the information desk")
                                     })
                                        {
                                            Text("Make \(self.announceType[selectedAnnounceType]) Announcement")
                                        }
                                }
                            else {
                                Text(" ")
                                Text("Enjoy the benefits of CareDrum membership!")
                            }
                            
                    }
                }.navigationBarTitle("Sign Up")
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

        func MakeAnnouncement(myText: String) {
            let utterance = AVSpeechUtterance(string: myText)
            utterance.rate = 0.5
            let synthetizer = AVSpeechSynthesizer()
            synthetizer.speak(utterance)
            
        }

struct MemberManagement_Previews: PreviewProvider {
    static var previews: some View {
        MemberManagement()
    }
}
