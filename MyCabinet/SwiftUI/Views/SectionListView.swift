import SwiftUI

struct SectionListView: View {
    @State var sections: FetchedResults<Section>

    var body: some View {
        List {
            ForEach(sections) { section in
                SwiftUI.Section(header: Text(section.title)) {
                    ForEach(section.items.allObjects as? [Item] ?? [], id: \.self) { item in
                        Text(item.name)
                    }
                }
            }
        .navigationTitle("Sections")
        }
    }
}

//struct SectionListView_Previews: PreviewProvider {
    //static var previews: some View {
        //let items1 = [
            //Item(),
            //Item()
        //]
        //let items2 = [
            //Item(),
            //Item()
        //]
        //let sections = [
            //Section(),
            //Section()
        //]
        
        //SectionListView(sections: sections)
    //}
//}
