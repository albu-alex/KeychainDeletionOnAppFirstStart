//
//  AppInitiationService.swift
//  KeychainDeletionOnAppInitialise
//
//  Created by Alex Albu on 25.01.2024.
//

import Foundation

final class AppInitiationService {
    private let isAppInitiatedKey = "isAppInitiated"

    private var isAppInitiated: Bool? {
        get {
            UserDefaults.standard.bool(forKey: isAppInitiatedKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: isAppInitiatedKey)
        }
    }

    var isAppOnFirstStart: Bool {
        isAppInitiated != nil && isAppInitiated == false
    }

    func set(isAppInitiated: Bool) {
        self.isAppInitiated = isAppInitiated
    }
}
