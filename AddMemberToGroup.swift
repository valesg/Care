//
//  AddMemberToGroup.swift
//  Care
//
//  Created by Guy Vales on 2020-02-01.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct AddMemberToGroup: View {
    @State var addedMemberID: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("OnCall Group - Add member")
                    TextField("Member ID", text: $addedMemberID)
                    Button(action: {
                        CareMakeAnnouncement(myText: "Congrats, you have added care giver with member I-D  \(self.addedMemberID) to the OnCall Group.")
                    })
                       {
                           Text("Add Member to Group")
                       }
                    
            }

}
        .navigationBarTitle("Add Member")
}
}
}
struct AddMemberToGroup_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberToGroup()
    }
}
