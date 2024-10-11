### Simple Navigation for SwiftUI

**NavigationKit** is a SwiftUI library that streamlines navigation between views, making it easier to manage navigation paths using a custom `Navigator` class and a `NavigatorStack` view component.

#### Features:

*   **Push/Pop Navigation**: Effortlessly navigate between views using the push and pop patterns.
*   **Return to Root**: Navigate back to the root view with minimal effort.
*   **Custom Navigation Paths**: Define navigation paths with associated views.

#### Usage:

### 1\. Define Navigation Paths

Create an enum conforming to `NavigationDestination`, where each case represents a view in the navigation stack.

```swift
import SwiftUI
import NavigationKit

enum NavigationPaths: NavigationDestination {
    case settings
    case profile
        
    var body: some View {
        switch self {
        case .settings:
            SettingsView()
        case .profile:
            ProfileView()
        }
    }
}
```

### 2\. Initialize the Navigator

Set up `Navigator` in your `App` or main view.

```swift
import SwiftUI
import NavigationKit

@main
struct ExampleApp: App {
    @StateObject var navigator = Navigator<NavigationPaths>()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(navigator)
        }
    }
}
```

### 3\. Implement Navigation

Use `NavigatorStack` to manage the navigation within your views.

```swift
import SwiftUI
import NavigationKit

struct MainView: View {
    @EnvironmentObject var navigator: Navigator<NavigationPaths>

    var body: some View {
        NavigatorStack(navigator: navigator) {
            VStack {
                Button("Go to Settings") {
                    navigator.pushView(.settings)
                }
                Button("Go to Profile") {
                    navigator.pushView(.profile)
                }
            }
        }
    }
}
```

### 4\. Pop Views

Inside your views, use `navigator.popViews(count:)` to return to previous views or `navigator.popToRoot()` to return to the root view.

```swift
import SwiftUI
import NavigationKit

struct ProfileView: View {
    @EnvironmentObject var navigator: Navigator<NavigationPaths>

    var body: some View {
        Button("Back to Root View") {
            navigator.popToRoot()
        }
    }
}
```

An [ExampleApp](https://github.com/aadzhanow/NavigationKit/tree/main/ExampleApp) demonstrating how to use **NavigationKit** is included in the package.
