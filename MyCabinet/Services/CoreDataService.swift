import CoreData
import UIKit

class CoreDataService: ObservableObject {
    
    static let shared = CoreDataService()
    
    let container: NSPersistentContainer
    
    private init() {
        // Initialize the NSPersistentContainer
        container = NSPersistentContainer(name: "MyCabinet")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    // Preview initializer
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MyCabinet")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
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
    func createSection(title: String, items: NSSet, iconName: String) -> Section {
        let section = Section(context: context)
        section.title = title
        section.items = items
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
    func updateSection(section: Section, newTitle: String?, newItems: NSSet?, newIconName: String?) {
        if let newTitle = newTitle {
            section.title = newTitle
        }
        if let newItems = newItems {
            section.items = newItems
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
    
    func fetchItems(for section: Section) -> NSSet {
        return section.items
    }
    
    // Add more methods for adding, deleting, and updating data
}
