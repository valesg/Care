//
//  AppView.swift
//  Care
//
//  Created by Guy Vales on 2020-01-21.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var careRequests: [CareRequestRecord] = []
    @State var selected = 2
    
    var body: some View {
        TabView(selection: $selected) {
            
            OnCallReplacementStaff(allOnCallCandidates: onCallStaffTestData).tabItem({
                Image(systemName: "plus.circle")
                    .font(.title)
                Text("OnCall")
            }).tag(1)
            
                CareRequest(careRequests: testData).tabItem({
                Image(systemName: "square.and.pencil")
                    .font(.title)
                Text("Care Request")
            }).tag(2)

            PatientMonitor().tabItem({
                Image(systemName: "eye")
                    .font(.title)
                Text("Patient Monitor")
            }).tag(3)
            MemberManagement().tabItem({
                Image(systemName: "person")
                    .font(.title)
                Text("Member")
            }).tag(4)

            AppSettings().tabItem({
                Image(systemName: "gear")
                    .font(.title)
                Text("Settings")
            }).tag(5)
        } //.accentColor(Color.red)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(careRequests: testData)
    }
}
