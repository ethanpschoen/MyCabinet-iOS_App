import XCTest
@testable import MyCabinet

class ExpirationServiceTests: XCTestCase {

    var expirationService: ExpirationService!
    
    override func setUp() {
        super.setUp()
        expirationService = ExpirationService()
    }
    
    func testNotificationForExpiringItems() {
        let item = Item(name: "Milk", expirationDate: Date(timeIntervalSinceNow: 86400)) // 1 day from now
        expirationService.scheduleNotification(for: item)
        
        // Assert that the notification was scheduled
        // You might use a mock or check for a side effect if you've implemented notifications
    }
    
    func testNoNotificationForNonExpiringItems() {
        let item = Item(name: "Canned Beans", expirationDate: Date(timeIntervalSinceNow: 86400 * 365)) // 1 year from now
        expirationService.scheduleNotification(for: item)
        
        // Assert that no notification was scheduled
    }
}
