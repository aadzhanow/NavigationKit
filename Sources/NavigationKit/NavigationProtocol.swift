//
//  NavigationProtocol.swift
//  NavigationKit
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI

public typealias NavigationProtocol = View & Identifiable & Hashable & CaseIterable

public protocol Navigation: NavigationProtocol {}

public extension Navigation {
    var id: UUID { UUID() }
}
