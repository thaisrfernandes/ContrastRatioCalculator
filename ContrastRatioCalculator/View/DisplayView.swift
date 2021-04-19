import SwiftUI

struct DisplayView: View {
    var color1: Color
    var color2: Color
    var ratio: Double
    var frame: CGFloat
    @Binding var shouldFlip: Bool
    @Binding var fontSize1: CGFloat
    @Binding var fontSize2: CGFloat
    
    @State var scale: CGFloat = 1.0
    
    @State private var pressed = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(color1)
                    .cornerRadius(37)
                    .shadow(color: Color(red: 0.43, green: 0.56, blue: 0.69, opacity: 0.5), radius: 20, x: 0.0, y: 16)
                
                VStack {
                    
                    Text(ratioText(for: ratio))
                        .font(.system(size: fontSize1))
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                        .animation(.none)
                    
                    Text("Contrast Ratio")
                        .font(.system(size: fontSize2))
                        .animation(.none)
                }
                
                VStack {
                    Spacer()

                    HStack {
                        RoundedButton(icon: "minus", action: removeSize)

                        Spacer()

                        HStack {
                            Text(String(format: "%.1f pt", fontSize1))
                                .fontWeight(.semibold)
                            Text("and")
                            Text(String(format: "%.1f pt", fontSize2))
                                .fontWeight(.semibold)
                        }
                        .font(.title3)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .background(hexToColor("#E5ECF2"))
                        .foregroundColor(rgbToColor([50, 56, 90]))
                        .cornerRadius(37)

                        Spacer()

                        RoundedButton(icon: "plus", action: addSize)
                    }
                }
                .padding(20)
            }
            .foregroundColor(color2)
            .gesture(MagnificationGesture()
                        .onChanged { value in
                            changeTextSizes(value: value)
                        }
            )
            .rotation3DEffect(self.shouldFlip ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default)
            .onChange(of: shouldFlip, perform: { value in
                if shouldFlip {
                    self.shouldFlip = false
                }
            })
        }
    }
    
    func changeTextSizes(value: MagnificationGesture.Value) {
        
        if value >= scale && fontSize1 != 180 {
            addSize()
        } else {
            removeSize()
        }
        
        self.scale = value.magnitude
    }
    
    func changeTextSizeOnHold() {
        while pressed {
            addSize()
        }
    }
    
    func addSize() {
        self.fontSize1 = self.fontSize1 + 1
        self.fontSize2 = self.fontSize2 + 0.6
    }
    
    func removeSize() {
        let isPositive2: Bool = fontSize2 - 1 > 0
        
        self.fontSize1 = isPositive2 ? self.fontSize1 - 1 : self.fontSize1
        self.fontSize2 = isPositive2 ? self.fontSize2 - 0.6 : self.fontSize2
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .previewDevice("iPad (8th generation)")
    }
}
