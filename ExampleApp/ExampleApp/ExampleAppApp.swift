//
//

//  NavigationProtocol.swift
import SwiftUI

public typealias NavigationProtocol = View & Identifiable & Hashable & CaseIterable

//  ExampleAppApp.swift
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

//  CustomNavigationStack.swift
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

//  NavigationPaths.swift
import SwiftUI

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

//  ExampleAppApp.swift
import SwiftUI

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

//  MainView.swift
import SwiftUI

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

//  HomeView.swift
import SwiftUI

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

//  ProfileView.swift
import SwiftUI

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
