import XCTest
@testable import MyCabinet

class NotificationServiceTests: XCTestCase {

    var notificationService: NotificationService!
    
    override func setUp() {
        super.setUp()
        //notificationService = NotificationService()
    }
    
    func testNotificationForExpiringItems() {
        //let item = Item() // 1 day from now
        //notificationService.scheduleNotification(for: item)
        
        // Assert that the notification was scheduled
        // You might use a mock or check for a side effect if you've implemented notifications
    }
    
    func testNoNotificationForNonExpiringItems() {
        //let item = Item() // 1 year from now
        //notificationService.scheduleNotification(for: item)
        
        // Assert that no notification was scheduled
    }
}
