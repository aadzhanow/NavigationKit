//
//  MainView.swift
//  ExampleApp
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI
import NavigationKit

struct MainView: View {
    @EnvironmentObject var navigator: Navigator<NavigationPaths>

    var body: some View {
        NavigatorStack(navigator: navigator) {
            VStack {
                Text("This is the main view")
                    .font(.title)
                
                Button(action: {
                    navigator.pushView(.settings)
                }, label: {
                    Text("Navigate to Settings")
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(.indigo, in: RoundedRectangle(cornerRadius: 10))
                })
                
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
}
