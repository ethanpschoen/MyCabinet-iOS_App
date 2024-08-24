import SwiftUI

struct SectionIconView: View {
    
    var sections: FetchedResults<Section>
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(sections) { section in
                    VStack {
                        Image(systemName: section.iconName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(section.title)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
