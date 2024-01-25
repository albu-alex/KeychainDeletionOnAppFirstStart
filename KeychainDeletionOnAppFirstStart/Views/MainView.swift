//
//  MainView.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel = AuthenticationService.shared
    @State private var username: String
    
    init(for username: String) {
        self.username = username
    }
    
    var body: some View {
        Text("Welcome, \(username)!")
            .padding()
        Button("Logout") {
            viewModel.deletePassword(for: username)
            viewModel.isLoggedIn = false
        }
        .padding()
    }
}
