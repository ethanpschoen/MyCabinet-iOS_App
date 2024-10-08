import SwiftUI
import CoreData
import UIKit

@main
struct MyCabinetApp: App {
    
    // Create an observable instance of the Core Data service.
    @StateObject private var coreDataService = CoreDataService.shared
    
    // Register the AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Monitor the scene's phase (active, inactive, background)
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Inject the persistent container's managed object context into the environment
                .environment(\.managedObjectContext, coreDataService.context)
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                // App became active
                break
            case .inactive:
                // App became inactive
                break
            case .background:
                // App went to the background, save context here
                coreDataService.saveContext()
            @unknown default:
                break
        }
    }
}

// Custom AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyCabinet")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Custom setup code here
        return true
    }
}

}
