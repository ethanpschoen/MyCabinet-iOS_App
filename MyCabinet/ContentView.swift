import SwiftUI
import CoreData

struct ContentView: View {
    
    // Get a reference to the managed object context from the environment
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Section.title, ascending: true)], animation: .default)
    private var sections: FetchedResults<Section>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    SwiftUI.Section(header: Text(section.title)) {
                        ForEach(section.items.allObjects as? [Item] ?? [], id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text(item.name).font(.headline)
                                Text("Expires on \(formattedDate(item.expirationDate))").font(.subheadline)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("Sections")
    }
    
    // Format the date as a readable string
    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "No Expiration Date" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a temporary context for the preview
        let coreDataService = CoreDataService(inMemory: true)
        let context = coreDataService.context
        
        // Prepare sample data
        prepareSampleData(context: context)
        
        // Return the ContentView with the prepared context
        return ContentView().environment(\.managedObjectContext, context)
    }
    
    // Function to prepare sample data
    static func prepareSampleData(context: NSManagedObjectContext) {
        let section = Section(context: context)
        section.title = "Sample Section"
        section.iconName = "sample_icon"
        
        let item1 = Item(context: context)
        item1.name = "Item 1"
        item1.expirationDate = Date().addingTimeInterval(86400 * 5)
        
        let item2 = Item(context: context)
        item2.name = "Item 2"
        item2.expirationDate = Date().addingTimeInterval(86400 * 10)

        section.items = NSSet(array: [item1, item2])
        
        // Save context to persist the sample data
        do {
            try context.save()
        } catch {
            print("Failed to save preview context: \(error)")
        }
    }
}
