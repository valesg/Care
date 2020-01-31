//
//  AppSettings.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct AppSettings: View {
    @State var sameGender = false
    @State var onDuty = true
    @State var haveCar = true
    @State var myOrg = false
    
    var body: some View {
            
            NavigationView {
                    VStack {
                    Text("Set preferences as a patient, a caregiver or caregiver manager. Caregivers can indicate On or Off Duty. Patients can set preferred gender of their caregivers etc.")
                    Text(" ")
                    
                    Toggle(isOn: $sameGender) {
                    Text("Caregiver's gender must be the same as patient")
                    }
                    
                    Toggle(isOn: $onDuty) {
                        Text("On Duty")
                    }
                    Toggle(isOn: $haveCar) {
                        Text("Have a car")
                    }
//                    Toggle(isOn: $myOrg) {
//                        Text("Only notify staff of care manager")
//                    }
                    Text(" ")
                    if haveCar && onDuty {
                        Text("Fantastic. You have a car and are on duty. Thank your for your participation in CareDrum.")
                        }
                    else if haveCar {
                        Text("Great! You have a car. ")
                    }
                    else if onDuty {
                        Text("Thank your for your participation in CareDrum. Enjoy the benefits of CareDrum membership.")
                    }
                    Spacer()
                    }.padding()
                       .navigationBarTitle(Text("Settings"))
                // .navigationBarTitle("Following", displayMode: .inline)
                .navigationBarHidden(false)
            }
        }
        
    }

struct AppSettings_Previews: PreviewProvider {
    static var previews: some View {
        AppSettings()
    }
}
