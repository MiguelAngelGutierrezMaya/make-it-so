//
//  RemindersListViewModel.swift
//  MakeItSo
//
//  Created by Keybe on 30/08/23.
//

import Foundation
import Factory
import Combine

class RemindersListViewModel: ObservableObject {
    @Published
    var reminders = [Reminder]()
    
    @Published
    var errorMessage: String?
    
    @Injected(\.remindersRepository)
    //private var remindersRepository: RemindersRepository =  RemindersRepository()
    private var remindersRepository: RemindersRepository
    
    init() {
        remindersRepository.$reminders
            .assign(to: &$reminders)
    }
    
    func addReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.addReminder(reminder)
            errorMessage = nil
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func updateReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.updateReminder(reminder)
            errorMessage = nil
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.removeReminder(reminder)
            errorMessage = nil
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func setCompleted(_ reminder: Reminder, isCompleted: Bool) {
        var editeReminder = reminder
        editeReminder.isCompleted = isCompleted
        updateReminder(editeReminder)
    }
    
//    func toggleCompleted(_ reminder: Reminder) {
//        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
//            reminders[index].isCompleted.toggle()
//        }
//    }
}
