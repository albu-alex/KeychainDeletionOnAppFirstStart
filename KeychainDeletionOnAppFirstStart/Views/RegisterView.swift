//
//  RegisterView.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject private var viewModel = AuthenticationService.shared
    @Binding var isShowingRegister: Bool
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Register") {
                viewModel.savePassword(password, for: username)
                isShowingRegister.toggle()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Register")
    }
}
