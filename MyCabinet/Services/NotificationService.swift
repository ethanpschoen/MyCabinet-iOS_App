import Foundation
import UserNotifications

class NotificationService {
    
    static let shared = NotificationService()
    
    private init() {}
    
    // MARK: - Request Notification Authorization
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                completion(granted, error)
            }
        }
    }
    
    // MARK: - Schedule Notification for an Item
    
    func scheduleNotification(for item: Item) {
        let expirationDate = item.expirationDate
        
        // Create content for the notification
        let content = UNMutableNotificationContent()
        content.title = "Item Expiration Alert"
        content.body = "\(item.name) is expiring soon!"
        content.sound = .default
        
        // Create a trigger for the notification
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: expirationDate), repeats: false)
        
        // Create a unique identifier for this notification
        let identifier = "\(item.name)-expiration"
        
        // Create the request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // Schedule the notification
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for \(item.name) at \(expirationDate)")
            }
        }
    }
    
    // MARK: - Cancel Notification for an Item
    
    func cancelNotification(for item: Item) {
        let identifier = "\(item.name)-expiration"
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        print("Notification canceled for \(item.name)")
    }
    
    // MARK: - Cancel All Notifications
    
    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("All notifications canceled")
    }
}
