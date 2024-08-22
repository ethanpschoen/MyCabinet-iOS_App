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
    @NSManaged public var iconName: String?
    
    // Computed property to get the count of items in the section
    var itemCount: Int {
        return items.count
    }
    
    // Computed property to get the items that are expired
    var expiredItems: [Item] {
        return items.filter { $0.isExpired }
    }
    
    // Initializer
    //init(title: String, items: [Item] = [], iconName: String) {
        //self.id = UUID()
        //self.title = title
        //self.items = items
        //self.iconName = iconName
    //}
    
    func findItem(byID id: UUID) -> Item? {
        return items.first { $0.id == id }
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
