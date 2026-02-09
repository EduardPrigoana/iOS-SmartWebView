import Foundation
import UserNotifications
import UIKit

// Manages all native permission requests for the application.
class PermissionManager: NSObject {
    
    // Use a singleton pattern to be accessible from anywhere and manage delegate callbacks.
    static let shared = PermissionManager()
    
    private override init() {
        super.init()
    }
    
    // Central function to request all permissions listed in swv.properties on launch.
    func requestInitialPermissions() {
        let context = SWVContext.shared
        
        if context.permissionsOnLaunch.contains("NOTIFICATIONS") {
            requestNotificationPermission()
        }
        

    }
    
    // --- Notification Permissions ---
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    print("Notification permission granted.")
                    // Once permission is granted, register for remote notifications.
                    UIApplication.shared.registerForRemoteNotifications()
                } else if let error = error {
                    print("Notification permission error: \(error.localizedDescription)")
                }
            }
        }
    }

}
