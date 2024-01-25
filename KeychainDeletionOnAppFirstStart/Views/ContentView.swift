//
//  ContentView.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import SwiftUI
import Security

struct ContentView: View {
    let appInitiationService = AppInitiationService()
    let authenticationServiceInstance = AuthenticationService.shared
    
    init() {
        if appInitiationService.isAppOnFirstStart {
            authenticationServiceInstance.clearKeychain()
            appInitiationService.set(isAppInitiated: true)
        }
    }
    
    var body: some View {
       LoginView()
    }
}

#Preview {
    ContentView()
}
