//
//  OnCallStaffDetail.swift
//  Care
//
//  Created by Guy Vales on 2020-01-25.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct OnCallStaffDetail: View {
    var body: some View {
        NavigationView {
        
        VStack () {
            Image("CareNotification")
            .resizable()
            .aspectRatio(contentMode: .fit)
          Text("Submit request for selected caregiver. He/She receives notification and may opt to accept or decline OnCall invite. Managers can track progress. Delete option allows removal of selected caregiver from the OnCall group")
        }
        
    }
        .navigationBarTitle(Text("Group Member"))
}
}

struct OnCallStaffDetail_Previews: PreviewProvider {
    static var previews: some View {
        OnCallStaffDetail()
    }
}
