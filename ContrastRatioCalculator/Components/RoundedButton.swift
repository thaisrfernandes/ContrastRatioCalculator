import SwiftUI

struct RoundedButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Capsule()
                    .fill(hexToColor("#E5ECF2"))
                
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(rgbToColor([50, 56, 90]))
                        .shadow(color: Color(red: 0.43, green: 0.56, blue: 0.69, opacity: 0.5), radius: 5, x: 0.0, y: 8)
                }
                .frame(width: 30, height: 30)
            }
            .frame(width: 40, height: 40)

        }
    }
}
