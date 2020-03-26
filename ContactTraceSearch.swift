//
//  ContactTraceSearch.swift
//  Tender
//
//  Created by Guy Vales on 2020-03-23.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import SwiftUI

struct ContactTraceSearch: View {
    @State private var searchTerm: String = ""
    @State var isModal = false
    
    let names = ["John - Nurse Janet", "Bill - Nurse Lucy", "Tom - Nurse Mary"]
    
    var body: some View {
        NavigationView {
        List {
            
            SearchBar(text: $searchTerm)
            
            ForEach(self.names.filter {
            self.searchTerm.isEmpty ? true :
            $0.localizedCaseInsensitiveContains(self.searchTerm)
            }, id: \.self) {name in
            Text(name)
            }
        }
    .navigationBarTitle("This is us")
    .navigationBarItems(trailing:

    HStack {

        Button("Edit") {
            self.isModal = true
        }.sheet(isPresented: $isModal, content: {
            AddCareRequest()
        })
    })
    }

}
}

struct ContactTraceSearch_Previews: PreviewProvider {
    static var previews: some View {
        ContactTraceSearch()
    }
}
