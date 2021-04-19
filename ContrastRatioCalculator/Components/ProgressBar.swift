import SwiftUI

struct ProgressBar: View {
    var points: Double
    var height: CGFloat
    
    var barHeight: CGFloat {
        return height * 0.82
    }
    
    var progress: CGFloat {
        let value = barHeight * CGFloat(points)
        return value < 40 ? 40 : value
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Image(systemName: points > 0.70 ? "hand.thumbsup.fill" : "hand.thumbsup")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.white)
                    .padding(.vertical, 10)
                    .shadow(color: Color(red: 0.43, green: 0.56, blue: 0.69, opacity: 0.5), radius: 20, x: 0.0, y: 16)
                
                Capsule()
                    .fill(rgbToColor([50, 56, 90]))
                    .frame(height: progress)
            }
            .frame(height: barHeight)
            
            Spacer()
            
            Image(systemName: points < 0.70 ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                .resizable()
                .scaledToFit()
            
        }
        .frame(width: 40)
        .foregroundColor(rgbToColor([50, 56, 90]))
        .animation(.default)
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
