//
//  FocusUsingEnumView.swift
//  MakeItSo
//
//  Created by Miguel Angel Gutierrez Maya on 11/04/24.
//

import SwiftUI

enum FocusableField2: Hashable {
    case firstName
    case lastName
}

struct FocusUsingEnumView: View {
    @FocusState private var focus: FocusableField2?
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        Form {
            TextField("First name", text: $firstName)
                .focused($focus, equals: .firstName)
            
            TextField("Last name", text: $lastName)
                .focused($focus, equals: .lastName)
            Button("save") {
                if firstName.isEmpty {
                    focus = .firstName
                } else if lastName.isEmpty {
                    focus = .lastName
                } else {
                    // Save the data
                    focus = nil
                }
            }
        }
    }
}

#Preview {
    FocusUsingEnumView()
}
