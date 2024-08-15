import Foundation

// MARK: - Item Model

struct Item: Identifiable, Codable {
    // Unique identifier for each item
    var id: UUID
    
    // The name of the item
    var name: String
    
    // The date the item was added
    var dateAdded: Date
    
    // The expiration date of the item
    var expirationDate: Date
    
    // Optional notes for the item
    var notes: String?
    
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
    init(name: String, dateAdded: Date = Date(), expirationDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.name = name
        self.dateAdded = dateAdded
        self.expirationDate = expirationDate
        self.notes = notes
    }
}


