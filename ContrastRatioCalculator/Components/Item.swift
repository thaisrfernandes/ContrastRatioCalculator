import SwiftUI

struct Item: View {
    let label: String
    let value: String
    let isRight: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            Text(isRight ? "✅" : "🚫")
                .padding(.top, 3)

            Text(label)
                .font(.title2)
                .lineLimit(2)
                                
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
        }
        .foregroundColor(rgbToColor([50, 56, 90]))
        .animation(.default)
    }
}

struct Item_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
