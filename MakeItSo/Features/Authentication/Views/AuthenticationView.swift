//
//  AuthenticationView.swift
//  MakeItSo
//
//  Created by Miguel Angel Gutierrez Maya on 1/11/23.
//

import SwiftUI
import Combine


struct AuthenticationView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    
    
    var body: some View {
        VStack {
            switch viewModel.flow {
            case .login:
                LoginView()
                    .environmentObject(viewModel)
            case .signUp:
                SignupView()
                    .environmentObject(viewModel)
            }
        }
    }
}


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
