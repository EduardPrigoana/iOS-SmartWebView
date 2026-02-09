import SwiftUI

@main
struct MonochromeApp: App {
    
    // This connects our AppDelegate to the SwiftUI app lifecycle.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
