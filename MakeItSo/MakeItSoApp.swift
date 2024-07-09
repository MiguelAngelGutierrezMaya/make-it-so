//
//  MakeItSoApp.swift
//  MakeItSo
//
//  Created by Keybe on 29/08/23.
//

import SwiftUI
import Factory
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    @LazyInjected(\.authenticationService)
    private var authenticationService
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        authenticationService.signInAnonymously()
        
        //        let useEmulator = UserDefaults.standard.bool(forKey: "useEmulator")
        //
        //        if useEmulator {
        //            let settings = Firestore.firestore().settings
        //            settings.host = "localhost:8080"
        //            settings.isSSLEnabled = false
        //            Firestore.firestore().settings = settings
        //
        //            Auth.auth().useEmulator(withHost: "localhost", port: 9099)
        //        }
        
        return true
    }
}

@main
struct MakeItSoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RemindersListView()
                    .navigationTitle("Reminders")
            }
        }
    }
}
