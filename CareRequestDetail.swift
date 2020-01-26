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
        Text("Hello! View details on selected Care Request")
    }
}

struct CareRequestDetail_Previews: PreviewProvider {
    static var previews: some View {
        CareRequestDetail(careRequest: testData[1])
    }
}
