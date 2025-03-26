import SwiftUI

struct CustomPageView: View {
    @State private var selectedIndex = 0
    let pages = ["Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<pages.count, id: \.self) { index in
                    Text("\(pages[index]) Page")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(index == 0 ? Color.red : index == 1 ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
            
            // Custom Indicators
            HStack {
                ForEach(0..<pages.count, id: \.self) { index in
                    Circle()
                        .fill(selectedIndex == index ? Color.black : Color.gray)
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
            .padding(.top, 10)
        }
    }
}

struct ContntView: View {
    var body: some View {
        CustomPageView()
    }
}
struct OerCardViw_Previews: PreviewProvider {
    static var previews: some View {
        ContntView()
    }
}
