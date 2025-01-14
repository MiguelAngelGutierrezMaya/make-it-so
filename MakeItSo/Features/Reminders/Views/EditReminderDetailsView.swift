//
//  AddReminderView.swift
//  MakeItSo
//
//  Created by Keybe on 29/08/23.
//

import SwiftUI

struct EditReminderDetailsView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    enum Mode {
        case add
        case edit
    }
    
    var mode: Mode = .add
    
    @State
    var reminder = Reminder(title: "")
    
    @Environment(\.dismiss)
    private var dismiss
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    private func commit () {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title).focused($focusedField, equals: .title)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "New Reminder" : "Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text(mode == .add ? "Add" : "Done")
                    }.disabled(reminder.title.isEmpty)
                }
            }.onAppear {
                focusedField = .title
            }
        }
    }
}

struct EditReminderDetailsView_Previews: PreviewProvider {
  struct Container: View {
    @State var reminder = Reminder.samples[0]
    var body: some View {
      EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
        print("You edited a reminder: \(reminder.title)")
      }
    }
  }
  
  static var previews: some View {
    EditReminderDetailsView { reminder in
      print("You added a reminder: \(reminder.title)")
    }
    Container()
  }
}

//struct AddReminderView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditReminderDetailsView { reminder in
//            print("Your added a new reminder \(reminder.title)")
//        }
//    }
//}
