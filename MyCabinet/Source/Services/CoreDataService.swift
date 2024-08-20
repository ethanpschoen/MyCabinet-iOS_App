import CoreData
import UIKit

class CoreDataService: ObservableObject {
    
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
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - CRUD Operations
    
    // Create
    func createSection(title: String, items: [Item], iconName: String) -> Section {
        let section = Section(context: context)
        section.title = title
        section.items = NSSet(array: items)
        section.iconName = iconName
        saveContext()
        return section
    }
    
    // Read
    func fetchSections() -> [Section] {
        let fetchRequest: NSFetchRequest<Section> = Section.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch sections: \(error)")
            return []
        }
    }
    
    // Update
    func updateSection(section: Section, newTitle: String?, newItems: [Item]?, newIconName: String?) {
        if let newTitle = newTitle {
            section.title = newTitle
        }
        if let newItems = newItems {
            section.items = NSSet(array: newItems)
        }
        if let newIconName = newIconName {
            section.iconName = newIconName
        }
        saveContext()
    }
    
    // Delete
    func deleteSection(section: Section) {
        context.delete(section)
        saveContext()
    }
    
    func fetchItems(for section: Section) -> [Item] {
        // Implement Core Data fetch logic
        return []
    }
    
    // Add more methods for adding, deleting, and updating data
}
