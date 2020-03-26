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
            var jobTitle = ["Nurse", "PSW", "RNA"]
            var licenseIssuer = ["Ontario", "Quebec", "Alberta"]
            var profileType = ["Patient"]
            var gender = ["Female", "Male"]
            @State var adHocMsg: String = "This is an Ad-hoc message"
            @State private var selectedJobTitle = 0
            @State private var selectedLicenseIssuer = 0
            @State private var selectedProfile = 0
            @State private var selectedGender = 0
            @State var sayAnnouncement = false
            @State var firstName: String = ""
            @State var lastName: String = ""
            @State var password: String = ""
            @State var licenseId: String = ""
            @State var emailAddress: String = ""

            
            var body: some View {
                NavigationView {
                    Form {
//                        Section {
//                            Picker(selection: $selectedProfile, label: Text("Select your Profile")) {
//                            ForEach(0..<profileType.count) {
//                            Text(self.profileType[$0])
//                                                    }
//                                                }
//                        }
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
                            
                            if self.profileType[selectedProfile] == "Caregiver" {
                                
                                Picker(selection: $selectedJobTitle, label: Text("Caregiver Title")) {
                                    ForEach(0..<jobTitle.count) {
                                        Text(self.jobTitle[$0])
                                    }
                                }
                                
                                if self.jobTitle[selectedJobTitle] == "Nurse" {
                                    
                                Picker(selection: $selectedLicenseIssuer, label: Text("Licenced in")) {
                                    ForEach(0..<licenseIssuer.count) {
                                        Text(self.licenseIssuer[$0])
                                    }
                                }
                                TextField("License number", text: $licenseId)
                                }
                                 Button(action: {
                                     self.sayAnnouncement.toggle()
                                     MakeAnnouncement(myText: "Congrats, you have signed up as a care giver with a license from \(self.licenseIssuer[self.selectedLicenseIssuer]).")
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
