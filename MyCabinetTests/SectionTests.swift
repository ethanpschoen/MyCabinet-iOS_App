import XCTest
@testable import MyCabinet

class SectionTests: XCTestCase {

    func testSectionInitilization() {
        let section = Section()
        XCTAssertNotNil(section)
        XCTAssertEqual(section.title, "Dairy")
        XCTAssertEqual(section.items.count, 0)
    }
    
    func testAddingItemsToSection() {
        let section = Section()
        //let item = Item()
        //section.addItem(item)
        
        XCTAssertEqual(section.items.count, 1)
        //XCTAssertEqual(section.items.first.name, "Milk")
    }
}
