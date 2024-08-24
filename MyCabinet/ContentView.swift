import SwiftUI
import CoreData

struct ContentView: View {
    
    // Get a reference to the managed object context from the environment
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Section.title, ascending: true)], animation: .default)
    private var sections: FetchedResults<Section>
    
    @State private var isListView: Double = 0
    @State private var showSettings: Bool = false
    @State private var showAddSectionView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Slider to switch between list and icon view
                HStack {
                    Text("List View")
                    Slider(value: $isListView, in: 0...1, step: 1)
                        .frame(width: 150)
                    Text("Icon View")
                }
                .padding()
                
                // Conditional rendering based on slider value
                if isListView == 0 {
                    SectionListView(sections: sections)
                } else {
                    SectionIconView(sections: sections)
                }
                
                // Button to add a new section
                Button(action: {
                    showAddSectionView.toggle()
                }) {
                    Text("Add Section")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showAddSectionView) {
                    AddSectionView()
                        .environment(\.managedObjectContext, viewContext)
                }
                
                // Settings Button
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                }
            }
        }
        .navigationTitle("My Cabinet")
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
