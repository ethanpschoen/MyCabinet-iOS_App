import XCTest
@testable import MyCabinet

class ItemTests: XCTestCase {

    func testItemInitialization() {
        // Test valid initialization
        let item = Item() // 1 day from now
        XCTAssertNotNil(item)
        XCTAssertEqual(item.name, "Milk")
        XCTAssertNotNil(item.expirationDate)
    }
    
    func testDaysUntilExpiration() {
        // Test expiration in 1 day
        let item = Item() // 1 day from now
        XCTAssertEqual(item.daysUntilExpiration, 1)
        
        // Test already expired item
        let expiredItem = Item() // 1 day ago
        XCTAssertEqual(expiredItem.daysUntilExpiration, -1)
    }
}
