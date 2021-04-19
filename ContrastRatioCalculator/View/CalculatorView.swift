import SwiftUI

struct CalculatorView: View {
    @State var color1: Color = rgbToColor([50, 56, 90])
    @State var color2: Color = Color.white
    
    @State var fontSize1: CGFloat = 50.0
    @State var fontSize2: CGFloat = 30.0
    
    @State var shouldFlip: Bool = false
    
    let width = UIScreen.width * 0.95
    let height = UIScreen.height * 0.95
    
    var ratio: Double {
        return ContrastRatioCalculator(color1: color1, color2: color2).result
    }
    
    var points: Double {
        return PointsEngine(ratio: ratio, fontSize1: fontSize1, fontSize2: fontSize2).result
    }
    
    var body: some View {
        VStack {
            HStack {
                ColorPickersView(color1: $color1, color2: $color2, shouldFlip: $shouldFlip)
                    .frame(width: width * 0.80)
                
                VStack {}
                    .frame(width: width * 0.10)
            }
            .padding(.vertical, 30)
            .padding(.top, 20)
                        
            Spacer()
            
            HStack(alignment: .center) {
                DisplayView(color1: color1, color2: color2, ratio: ratio, frame: width * 0.9, shouldFlip: $shouldFlip, fontSize1: $fontSize1, fontSize2: $fontSize2)
                
                HStack {
                    Spacer()
                    ProgressBar(points: points, height: height * 0.65)
                }.frame(width: width * 0.10)
            }
            .frame(width: width * 0.9, height: height * 0.66)
            
            Spacer()
            
            HStack {
                DetailsView(ratio: ratio, largeTextSize: fontSize1, smallTextSize: fontSize2)
                    .frame(width: width * 0.9)
            }
            .padding(.vertical, 30)
            .padding(.bottom, 20)
            
        }
        .frame(width: UIScreen.width, height: UIScreen.height)
        .background(hexToColor("#F8F8F8"))
        .ignoresSafeArea()
    }
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
