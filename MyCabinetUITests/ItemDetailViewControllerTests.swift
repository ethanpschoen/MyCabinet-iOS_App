import XCTest
@testable import MyCabinet

class ItemDetailViewControllerTests: XCTestCase {

    var viewController: ItemDetailViewController!
    
    override func setUp() {
        super.setUp()
        // Initialize the view controller from the storyboard or programatically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as? ItemDetailViewController
        viewController.loadViewIfNeeded()
    }
    
    func testViewControllerDisplaysItemDetails() {
        // Mock item
        let item = Item(name: "Milk", expirationDate: Date(timeIntervalSinceNow: 86400)) // 1 day from now
        viewController.item = item
        
        // Load the view
        viewController.viewDidLoad()
        
        // Test if the item details are correctly displayed
        XCTAssertEqual(viewController.itemNameLabel.text, "Milk")
        XCTAssertEqual(viewController.expirationDateLabel.text, "Expires in 1 day")
    }
    
    func testSaveButtonSavesItem() {
        // Simulate user editing and saving the item
        viewController.nameTextField.text = "Eggs"
        viewController.saveButtonTapepd(UIButton())
        
        // Assert the item was updated
        XCTAssertEqual(viewController.item?.name, "Eggs")
    }
}
