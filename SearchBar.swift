//
//  SearchBar.swift
//  Tender
//
//  Created by Guy Vales on 2020-03-23.
//  Copyright © 2020 Guy Vales. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {

@Binding var text: String

class Coordinator: NSObject, UISearchBarDelegate {
@Binding var text: String
init(text: Binding<String>) {
_text = text
}

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
text = searchText
}

}

func makeCoordinator() -> SearchBar.Coordinator {
 return Coordinator(text: $text)
}

func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
let searchBar = UISearchBar(frame: .zero)
searchBar.delegate = context.coordinator
return searchBar
    }

func updateUIView(_ uiView: UISearchBar,context:UIViewRepresentableContext<SearchBar>) {
uiView.text = text
    }

}

