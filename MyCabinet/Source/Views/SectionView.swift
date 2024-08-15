import SwiftUI

struct SectionView: View {
    @State var section: Section

    var body: some View {
        List {
            ForEach(section.items) { item in
                ItemRowView(item: item)
            }
        }
        .navigationTitle(section.title)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            Item(name: "Milk", expirationDate: Date().addingTimeInterval(-86400)),
            Item(name: "Cheese", expirationDate: Date().addingTimeInterval(86400 * 5))
        ]
        let section = Section(title: "Dairy", items: items)
        
        SectionView(section: section)
    }
}
