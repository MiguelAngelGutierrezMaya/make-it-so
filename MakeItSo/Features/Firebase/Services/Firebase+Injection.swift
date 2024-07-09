//
//  Firebase+Injection.swift
//  MakeItSo
//
//  Created by Miguel Angel Gutierrez Maya on 20/10/23.
//

import Foundation
import Factory
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension Container {
    /// Determines whether to use the Firebase Local Emulator Suite.
    /// To use the local emulator, go to the active scheme, and add `-useEmulator YES`
    /// to the _Arguments Passed On Launch_ section.
    public var useEmulator: Factory<Bool> {
        Factory(self) {
            let value = UserDefaults.standard.bool(forKey: "useEmulator")
            print("useEmulator: \(value)")
            return value
        }.singleton
    }
    
    public var auth: Factory<Auth> {
        Factory(self) {
            var environment = ""
            if Container.shared.useEmulator() {
                let host = "localhost"
                let port = 9099
                environment = "to use the local emulator on \(host):\(port)"
                Auth.auth().useEmulator(withHost: host, port: port)
            }
            else {
                environment = "to use the Firebase backend"
            }
            print("Configuring Firebase Auth \(environment).")
            return Auth.auth()
        }.singleton
    }
    
    public var firestore: Factory<Firestore> {
        Factory(self) {
            var environment: String = ""
            if Container.shared.useEmulator() {
                let settings = Firestore.firestore().settings
                settings.host = "localhost:8080"
                settings.cacheSettings = MemoryCacheSettings()
                settings.isSSLEnabled = false
                environment = "to use the local emulator \(settings.host)"
                
                Firestore.firestore().settings = settings
                //Auth.auth().useEmulator(withHost: "localhost", port: 9099)
            } else {
                environment = "to use the Firebase backend"
            }
            
            print("Firestore configured \(environment)")
            
            return Firestore.firestore()
        }.singleton
    }
}
