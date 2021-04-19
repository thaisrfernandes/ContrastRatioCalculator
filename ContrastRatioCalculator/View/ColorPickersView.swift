import SwiftUI

struct ColorPickersView: View {
    @Binding var color1: Color
    @Binding var color2: Color
    @Binding var shouldFlip: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            CustomColorPicker(selection: $color1)
            
            Spacer()
            
            Button (action: switchColors, label: {
                Image(systemName: "arrow.left.arrow.right")
                    .imageScale(.large)
            })
            .accentColor(rgbToColor([50, 56, 90]))
            
            Spacer()
            
            CustomColorPicker(selection: $color2, invert: true)
            
            Spacer()
        }
    }
    
    func switchColors() {
        let newColor2 = self.color1
        
        self.color1 = self.color2
        self.color2 = newColor2
        
        self.shouldFlip = true
    }
}

struct ColorPickersView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
