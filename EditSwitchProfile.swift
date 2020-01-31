//
//  EditSwitchProfile.swift
//  Care
//
//  Created by Guy Vales on 2020-01-29.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct EditSwitchProfile: View {
    var body: some View {
        NavigationView {
            VStack () {
                Text("When already logged-in, you can Edit your profile or Switch it to Patient, Caregiver or Caregiver Manager. This page is smilar to the Sign-up page but with pre-filled info.")
            }
        .navigationBarTitle("Edit or Switch Profile")
        }
        
    }
}

struct EditSwitchProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditSwitchProfile()
    }
}
