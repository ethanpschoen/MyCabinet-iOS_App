import XCTest
@testable import MyCabinet

class ItemTests: XCTestCase {

    func testItemInitialization() {
        // Test valid initialization
        let item = Item(name: "Milk", expirationDate: Date(timeIntervalSinceNow: 86400)) // 1 day from now
        XCTAssertNotNil(item)
        XCTAssertEqual(item.name, "Milk")
        XCTAssertNotNil(item.expirationDate)
        
        // Test initialization with a nil expiration date
        let itemWithoutExpiration = Item(name: "Canned Beans", expirationDate: nil)
        XCTAssertNotNil(itemWithoutExpiration)
        XCTAssertEqual(itemWithoutExpiration.name, "Canned Beans")
        XCTAssertNil(itemWithoutExpiration.expirationDate)
    }
    
    func testDaysUntilExpiration() {
        // Test expiration in 1 day
        let item = Item(name: "Milk", expirationDate: Date(timeIntervalSinceNow: 86400)) // 1 day from now
        XCTAssertEqual(item.daysUntilExpiration, 1)
        
        // Test already expired item
        let expiredItem = Item(name: "Bread", expirationDate: Date(timeIntervalSinceNow: -86400)) // 1 day ago
        XCTAssertEqual(expiredItem.daysUntilExpiration, -1)
    }
}
