//
//  SettingsView.swift
//  ExampleApp
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI
import NavigationKit

struct SettingsView: View {
    @EnvironmentObject var navigator: Navigator<NavigationPaths>

    var body: some View {
        VStack {
            Text("This is the settings view")
                .font(.title)
            
            Button(action: {
                navigator.pushView(.profile)
            }, label: {
                Text("Navigate to Profile")
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(.teal, in: RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding()
    }
}
