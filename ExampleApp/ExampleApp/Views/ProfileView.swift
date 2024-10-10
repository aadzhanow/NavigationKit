//
//  ProfileView.swift
//  ExampleApp
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI
import NavigationKit

struct ProfileView: View {
    @EnvironmentObject var navigator: Navigator<NavigationPaths>

    var body: some View {
        VStack {
            Text("This is the profile view")
                .font(.title)

            Button(action: {
//                navigator.returnToRoot()
                navigator.popViews(count: 10)
            }, label: {
                Text("Back to Root View")
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(.teal, in: RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding()
    }
}
