//
//  AuthenticationService.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import Foundation

class AuthenticationService: ObservableObject {
    static let shared = AuthenticationService()
    
    @Published var isLoggedIn = false
    @Published var isShowingRegister = false

    func checkLogin(for username: String, and password: String) {
        if loadPassword(for: username) == password {
            isLoggedIn = true
        }
    }
    
    func clearKeychain() {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        SecItemDelete(query as CFDictionary)
    }

    func deletePassword(for username: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "passwordManager",
            kSecAttrAccount as String: username,
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!
        ]
        SecItemDelete(query as CFDictionary)
    }

    func loadPassword(for username: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "passwordManager",
            kSecAttrAccount as String: username,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
    
        if status == errSecSuccess {
            if let data = result as? Data {
                return String(data: data, encoding: .utf8)
            }
        }

        return nil
    }

    func savePassword(_ password: String, for username: String) {
        guard let data = password.data(using: .utf8) as? AnyObject else {
            return
        }

        print(username)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "passwordManager",
            kSecAttrAccount as String: username,
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!,
            kSecValueData as String: data
        ]

        SecItemAdd(query as CFDictionary, nil)
    }
}
