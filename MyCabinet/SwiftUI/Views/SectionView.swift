import SwiftUI

struct SectionView: View {
    @State var section: Section

    var body: some View {
        List {
            ForEach(Array(section.items as? Set<Item> ?? [])) { item in
                ItemRowView(item: item)
            }
        }
        .navigationTitle(section.title)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            Item(),
            Item()
        ]
        let section = Section()
        
        SectionView(section: section)
    }
}
