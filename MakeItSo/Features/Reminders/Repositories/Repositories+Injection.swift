//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by Miguel Angel Gutierrez Maya on 20/10/23.
//

import Foundation
import Factory

extension Container {
    public var remindersRepository: Factory<RemindersRepository> {
        self {
            RemindersRepository()
        }.singleton
    }
}
