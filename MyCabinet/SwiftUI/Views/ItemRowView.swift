import SwiftUI

struct ItemRowView: View {
    let item: Item

    var body: some View {
        HStack {
            Text(item.name)
                .font(.headline)
            
            Spacer()
            
            Text(item.isExpired ? "Expired" : "\(item.daysUntilExpiration ?? 0) days left")
                .foregroundColor(item.isExpired ? .red : .green)
                .font(.subheadline)
        }
        .padding()
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item())
            .previewLayout(.sizeThatFits)
    }
}
