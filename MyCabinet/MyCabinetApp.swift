import SwiftUI

@main
struct MyCabinetApp: App {
    
    // Create an observable instance of the Core Data stack
    @StateObject private var coreDataService = CoreDataService.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Inject the persistent container's managed object context into the environment
                .environment(\.managedObjectContext, coreDataService.persistentContainer.viewContext)
        }
    }
}
