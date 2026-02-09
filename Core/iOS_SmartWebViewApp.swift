import SwiftUI

@main
struct iOS_SmartWebViewApp: App {
    
    // This connects our AppDelegate to the SwiftUI app lifecycle.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        PermissionManager.shared.requestInitialPermissions()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
