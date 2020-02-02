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
          Text("View details on a member of the group. Delete option allows removal of the selected caregiver from the group.")
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
