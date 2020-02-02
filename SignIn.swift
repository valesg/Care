//
//  SignIn.swift
//  Care
//
//  Created by Guy Vales on 2020-01-29.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    @State var myUsername: String = ""
    @State var myPassword: String = ""
    @State var isModal = false
    @State var isModal2 = false
    var body: some View {
        NavigationView {
            Form {
            Section {
            VStack() {
                TextField("Username", text: $myUsername)
                TextField("Password", text: $myPassword)
                Button(action: {
                    CareMakeAnnouncement(myText: "Congrats, you have logged in with username \(self.myUsername).")
                    })
                   {
                       Text("Login")
                   }
                    
            }
                .navigationBarTitle(Text("Sign In"))
                .navigationBarItems(trailing:
                HStack() {
                Button("Sign Up") {
                    self.isModal = true
                }.sheet(isPresented: $isModal, content: {
                    MemberManagement()
                })
        
                Button("Logged-In") {
                    self.isModal2 = true
                }.sheet(isPresented: $isModal2, content: {
                    EditSwitchProfile()
                })
                
                    
                })
        }
            
            }
        }

    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
