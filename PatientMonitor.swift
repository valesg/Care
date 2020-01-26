//
//  PatientMonitor.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct PatientMonitor: View {
    var body: some View {
        NavigationView {
        VStack() {
            
            Text("Hello, Patient Monitor!")
            Image("PatientMonitoring")
            .resizable()
            .aspectRatio(contentMode: .fit)
            Text("")
            Text("Monitor patient location, vital signs and even lost objects. Easily assign monitoring duties among team.  In case of emergency, maximize the number of eyes by sharing alerts with law enforcement, hospitals, taxis, media etc. ")
        }
    
    }
     .navigationBarTitle(Text("Patient Monitoring"))
}
}

struct PatientMonitor_Previews: PreviewProvider {
    static var previews: some View {
        PatientMonitor()
    }
}
