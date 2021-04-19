import SwiftUI

struct DetailsView: View {
    var ratio: Double
    var largeTextSize: CGFloat
    var smallTextSize: CGFloat
    
    var minimumSize: Bool {
        return largeTextSize >= 9 && smallTextSize >= 9
    }
    
    var idealSize: Bool {
        return largeTextSize >= 18 && smallTextSize >= 18
    }
    
    var body: some View {
        VStack{
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    Text("Ratio Details")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Item(label: "At least", value: " \(ratioText(for: 4.5))", isRight: ratio >= 4.5)
                        .padding(.bottom)
                    
                    Item(label: "Greater than", value: "\(ratioText(for: 7.5))", isRight: ratio >= 7.5)
                    
                }
                .padding(.leading, 40)
                .padding(.top, 26)
                
                Spacer()
                
                Divider()
                
                VStack(alignment: .leading) {
                    
                    Text("Text Size Details")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Item(label: "At least", value: "9 pt", isRight: minimumSize)
                        .padding(.bottom)
                    
                    Item(label: "Greater than", value: "18 pt", isRight: idealSize)
                }
                .padding(.leading, 40)
                .padding(.vertical, 26)
            
                
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(37)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
