import CoreData
import UIKit

class CoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {} // Singleton
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyCabinet")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchSections() -> [Section] {
        // Implement Core Data fetch logic
        return []
    }
    
    func fetchItems(for section: Section) -> [Item] {
        // Implement Core Data fetch logic
        return []
    }
    
    // Add more methods for adding, deleting, and updating data
}
