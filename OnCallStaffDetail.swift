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
          Text("Select OnCall caregivers and submit request. Caregivers receive notifications and may opt to accept or decline OnCall invite. Managers can track progress.")
        }
        
    }
        .navigationBarTitle(Text("How it Works?"))
}
}
struct OnCallStaffDetail_Previews: PreviewProvider {
    static var previews: some View {
        OnCallStaffDetail()
    }
}
