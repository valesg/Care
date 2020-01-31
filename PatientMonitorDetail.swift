//
//  PatientMonitorDetail.swift
//  Care
//
//  Created by Guy Vales on 2020-01-26.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct PatientMonitorDetail: View {
    var body: some View {
                NavigationView {
                VStack() {
                    Text("Monitoring Dashboard")
                    Image("PatientMonitoring")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    Text("")
                    Text("Get detailed info on monitored items such as patient location, vital signs or lost objects. Easily assign monitoring duties among care team.  In case of emergency, maximize the number of eyes on patients by sharing alerts with law enforcement, hospitals, taxis, media etc. ")
                }
            
            }
             .navigationBarTitle(Text("Patient Monitoring"))
        }
        }

struct PatientMonitorDetail_Previews: PreviewProvider {
    static var previews: some View {
        PatientMonitorDetail()
    }
}
