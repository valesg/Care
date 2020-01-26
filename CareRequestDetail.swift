//
//  CareRequestDetail.swift
//  Care
//
//  Created by Guy Vales on 2020-01-25.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct CareRequestDetail: View {
    let careRequest: CareRequestRecord
    var body: some View {
        NavigationView {
            VStack () {
            Image("CareRequestBell")
            .resizable()
            .aspectRatio(contentMode: .fit)
            
        Text("Hello! View details on selected Care Request. Details may include patient ID, requestor ID, full address, special comments etc.")
    }
        .navigationBarTitle(Text("Care Request Details"))
}
}
}
struct CareRequestDetail_Previews: PreviewProvider {
    static var previews: some View {
        CareRequestDetail(careRequest: testData[1])
    }
}
