import Foundation

class ExpirationService {
    
    static let shared = ExpirationService()
    
    private init() {}
    
    // MARK: - Check if Item is Expired
    
    func isItemExpired(_ item: Item) -> Bool {
        return item.expirationDate < Date()
    }
    
    // MARK: - Days Until Expiration
    
    func daysUntilExpiration(for item: Item) -> Int? {
        let currentDate = Date()
        if item.expirationDate >= currentDate {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: currentDate, to: item.expirationDate)
            return components.day
        } else {
            return nil // Item is already expired
        }
    }
    
    // MARK: - Check and Notify for Upcoming Expirations
    
    func checkForUpcomingExpirations(items: [Item], within days: Int) -> [Item] {
        //let currentDate = Date()
        //let calendar = Calendar.current
        var expiringItems = [Item]()
        
        for item in items {
            if let daysLeft = daysUntilExpiration(for: item), daysLeft <= days {
                expiringItems.append(item)
            }
        }
        
        return expiringItems
    }
    
    // MARK: - Notify Upcoming Expirations
    
    func notifyUpcomingExpirations(items: [Item], within days: Int) {
        let expiringItems = checkForUpcomingExpirations(items: items, within: days)
        for item in expiringItems {
            print("Reminder: \(item.name) is expiring in \(daysUntilExpiration(for: item) ?? 0) days.")
            // Optionally, trigger a notification or another form of alert
            NotificationService.shared.scheduleNotification(for: item)
        }
    }
}
