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
