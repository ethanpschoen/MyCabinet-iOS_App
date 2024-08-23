import Foundation
import CoreData

@objc(Section)
public class Section: NSManagedObject {

}

extension Section {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Section> {
        return NSFetchRequest<Section>(entityName: "Section")
    }

    // Unique identifier for each section
    @NSManaged public var id: UUID
    
    // The title of the section
    @NSManaged public var title: String
    
    // Array of items in this section
    @NSManaged public var items: NSSet
    
    // Name of icon for section
    @NSManaged public var iconName: String
    
    // Computed property to get the count of items in the section
    var itemCount: Int {
        return items.count
    }
    
    // Computed property to get the items that are expired
    var expiredItems: NSSet {
        // Convert NSSet to an Array to filter out (remove) all Items with isExpired == false
        let filteredArray = items.allObjects.filter { ($0 as? Item)?.isExpired ?? false }
        // Convert filtered array back to NSSet
        return NSSet(array: filteredArray)
    }
    
    // Initializer
    //init(title: String, items: [Item] = [], iconName: String) {
        //self.id = UUID()
        //self.title = title
        //self.items = items
        //self.iconName = iconName
    //}
    
    func findItem(byID name: String) -> Item? {
        // Convert NSSet to array for easier processing
        let array = items.allObjects as? [Item]
        // Search for item with matching ID
        return array?.first { $0.name == name }
    }
}

// MARK: Generated accessors for items
extension Section {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Section : Identifiable {

}
