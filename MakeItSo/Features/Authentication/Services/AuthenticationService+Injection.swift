//
//  AuthenticationService+Injection.swift
//  MakeItSo
//
//  Created by Miguel Angel Gutierrez Maya on 1/11/23.
//

import Foundation
import Factory


extension Container {
    public var authenticationService: Factory<AuthenticationService> {
        Factory(self) {
            AuthenticationService()
        }.singleton
    }
}
