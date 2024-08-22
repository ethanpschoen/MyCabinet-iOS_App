import Foundation

// MARK: - Section Model

class Section: Identifiable, Codable {
    // Unique identifier for each section
    var id: UUID
    
    // The title of the section
    var title: String
    
    // Array of items in this section
    var items: [Item]
    
    // Name of icon for section
    var iconName: String
    
    // Computed property to get the count of items in the section
    var itemCount: Int {
        return items.count
    }
    
    // Computed property to get the items that are expired
    var expiredItems: [Item] {
        return items.filter { $0.isExpired }
    }
    
    // Initializer
    init(title: String, items: [Item] = [], iconName: String) {
        self.id = UUID()
        self.title = title
        self.items = items
        self.iconName = iconName
    }
    
    // Method to add a new item to the section
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    // Method to remove an item from the section
    func removeItem(_ item: Item) {
        items.removeAll { $0.id == item.id }
    }
    
    func findItem(byID id: UUID) -> Item? {
        return items.first { $0.id == id }
    }
}
