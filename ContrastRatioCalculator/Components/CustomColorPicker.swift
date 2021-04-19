import SwiftUI

struct CustomColorPicker: View {
    @Binding var selection: Color
    
    var invert: Bool = false
    
    var body: some View {
        HStack {
            if !invert {
                Text("Background Color")
                    .font(.title2)
            }
            
            ColorPicker("", selection: $selection).frame(width: 30)
            
            if invert {
                Text("Foreground Color")
                    .font(.title2)
                    .padding(.leading, 8)
            }
        }
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
