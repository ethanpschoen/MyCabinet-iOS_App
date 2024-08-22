import XCTest
@testable import MyCabinet

class SectionTests: XCTestCase {

    func testSectionInitilization() {
        let section = Section(title: "Dairy", iconName: "Dairy")
        XCTAssertNotNil(section)
        XCTAssertEqual(section.title, "Dairy")
        XCTAssertTrue(section.items.isEmpty)
    }
    
    func testAddingItemsToSection() {
        let section = Section(title: "Dairy", iconName: "Dairy")
        let item = Item(name: "Milk", expirationDate: Date(timeIntervalSinceNow: 86400))
        section.addItem(item)
        
        XCTAssertEqual(section.items.count, 1)
        XCTAssertEqual(section.items.first?.name, "Milk")
    }
}
