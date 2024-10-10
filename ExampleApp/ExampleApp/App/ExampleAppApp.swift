//
//  ProfileView.swift
//  ExampleApp
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI
import NavigationKit

@main
struct ExampleAppApp: App {
    @StateObject var navigator = Navigator<NavigationPaths>()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(navigator)
        }
    }
}
