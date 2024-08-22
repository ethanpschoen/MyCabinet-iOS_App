import SwiftUI

struct ContentView: View {
    
    // Get a reference to the managed object context from the environment
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
