//
//  Navigator.swift
//  NavigationKit
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI

public class Navigator<Path: Hashable & CaseIterable & Identifiable>: ObservableObject {
    @Published var path = NavigationPath()
    
    public func pushView(_ destination: Path) {
        path.append(destination)
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func popViews(count: Int) {
        let viewsToPop = min(count, path.count)
        path.removeLast(viewsToPop)
    }
}
