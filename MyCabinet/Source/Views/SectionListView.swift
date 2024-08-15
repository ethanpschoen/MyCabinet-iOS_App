import SwiftUI

struct SectionListView: View {
    @State var sections: [Section]

    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    NavigationLink(destination: SectionView(section: section)) {
                        Text(section.title)
                    }
                }
            }
            .navigationTitle("Sections")
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        let items1 = [
            Item(name: "Milk", expirationDate: Date().addingTimeInterval(-86400)),
            Item(name: "Cheese", expirationDate: Date().addingTimeInterval(86400 * 5))
        ]
        let items2 = [
            Item(name: "Chicken", expirationDate: Date().addingTimeInterval(86400 * 2)),
            Item(name: "Beef", expirationDate: Date().addingTimeInterval(86400 * 7))
        ]
        let sections = [
            Section(title: "Dairy", items: items1),
            Section(title: "Meat", items: items2)
        ]
        
        SectionListView(sections: sections)
    }
}
