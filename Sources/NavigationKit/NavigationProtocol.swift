//
//  NavigationProtocol.swift
//  NavigationKit
//
//  Created by Alisher on 10.10.2024.
//

import SwiftUI

public typealias NavigationProtocol = View & Identifiable & Hashable & CaseIterable

public protocol NavigationDestionation: NavigationProtocol {}

public extension NavigationDestionation {
    var id: UUID { UUID() }
}
