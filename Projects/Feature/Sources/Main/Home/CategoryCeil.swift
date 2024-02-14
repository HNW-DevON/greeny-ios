import SwiftUI

struct CategoryCeil: View {
    
    var name: String
    var idx: Int
    
    var body: some View {
        NavigationLink {
            CompanyDetailView(category: name)
        } label: {
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Spacer()
                    Image("Category\(idx + 1)")
                    Text(name)
                        .foregroundStyle(Color.gray500)
                        .font(._caption)
                    Spacer()
                }
                Spacer()
            }
            .background(Color.gray100)
            .addGrayStroke(color: .gray300)
            .padding(1)
        }
    }
}
