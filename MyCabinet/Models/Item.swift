import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

}

// MARK: - Item Model

extension Item {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
    
    // Unique identifier for each item
    @NSManaged public var id: UUID
    
    // The name of the item
    @NSManaged public var name: String
    
    // The date the item was added
    @NSManaged public var dateAdded: Date
    
    // The expiration date of the item
    @NSManaged public var expirationDate: Date
    
    // Optional notes for the item
    @NSManaged public var notes: String?
    
    // Computed property to check if the item is expired
    var isExpired: Bool {
        return expirationDate < Date()
    }
    
    // Computed property to calculate days until expiration
    var daysUntilExpiration: Int? {
        let calendar = Calendar.current
        return calendar.dateComponents([.day], from: Date(), to: expirationDate).day
    }
    
    // Initializer
    //init(name: String, dateAdded: Date = Date(), expirationDate: Date, notes: String? = nil) {
        //self.id = UUID()
        //self.name = name
        //self.dateAdded = dateAdded
        //self.expirationDate = expirationDate
        //self.notes = notes
    //}
}

extension Item: Identifiable {
    
}
