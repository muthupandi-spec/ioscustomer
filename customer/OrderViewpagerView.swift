import SwiftUI

struct OrderViewpager: View {
    @State private var currentPage = 0
    let pageTitles = ["Active", "Cancel", "Completed"]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("ic_logo")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(.top, 12)

                Spacer() // Pushes text to center

                Text("Order")
                    .font(.headline)

                Spacer() // Balances the text in the center
            }
            .padding(.horizontal, 40)

            HStack {
                ForEach(0..<pageTitles.count, id: \.self) { index in
                    Text(pageTitles[index])
                        .font(.headline)
                        .foregroundColor(currentPage == index ? Color("colorPrimary") : .gray)
                        .underline(currentPage == index, color: Color("colorPrimary"))
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            currentPage = index // Navigate when tapped
                        }
                }
            }.padding()

            // Full-Screen TabView
            TabView(selection: $currentPage) {
                ActiveOrder_View().tag(0)
                Cacelorder_View().tag(1)
                Completedorder_View().tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Make sure it fills the screen
        }
    }
}




// Preview
struct OrderViewpager_Previews: PreviewProvider {
    static var previews: some View {
        OrderViewpager()
    }
}
