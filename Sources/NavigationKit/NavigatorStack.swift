//
//  NavigatorStack.swift
//  NavigationKit
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI

public struct NavigatorStack<Path: NavigationProtocol, Content: View>: View {
    @ObservedObject var navigator: Navigator<Path>
    let content: () -> Content
    
    public var body: some View {
        NavigationStack(path: $navigator.path) {
            content()
                .navigationDestination(for: Path.self) { $0 }
        }
    }
}
