//
//  LoginView.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = AuthenticationService.shared
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoggedIn {
                    MainView(for: username)
                } else {
                    TextField("Username", text: $username)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Login") {
                        viewModel.checkLogin(for: username, and: password)
                    }
                    .padding()

                    Button("Register") {
                        viewModel.isShowingRegister.toggle()
                    }
                    .sheet(isPresented: $viewModel.isShowingRegister) {
                        RegisterView(isShowingRegister: $viewModel.isShowingRegister)
                    }
                    .padding()
                }
            }
            .padding()
            .navigationTitle("Keychain Auth 🔑⛓️")
        }
    }
}
