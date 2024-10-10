//
//  NavigationPaths.swift
//  ExampleApp
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI
import NavigationKit

enum NavigationPaths: NavigationProtocol {
    case settings
    case profile
    
    var id: Self { self }
    
    var body: some View {
        switch self {
        case .settings:
            SettingsView()
        case .profile:
            ProfileView()
        }
    }
}
