import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = HomeviewModel()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0) {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
//                    Text("Error: \(errorMessage)")
//                        .foregroundColor(.red)
                    header
                    productview
                    button
                } else {
                    header
                    productview
                    button
                    
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }.onAppear {
            viewModel.getcartitem()
            
        }
    }
}

private var header:some View
{
    HStack {
        Image("ic_back")
            .resizable()
            .frame(width: 23, height: 23)
        
        Text("My Cart")
            .font(.system(size: 18))
            .bold()
            .padding(.horizontal, 30)
            .foregroundColor(.black)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.top, 10)
    .padding(.horizontal)
}
private var productview:some View{
    ScrollView {
        VStack(spacing: 10) {
            ForEach(0..<5, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) {
                        // Product Image with CardView
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 1)
                            
                            Image("frenchfries")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("French Fries")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.black)
                            
                            HStack(spacing: 5) {
                                Text("2 item")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 1, height: 12)
                                
                                Text("2 km")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                            }
                            
                            Text("$15")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.blue)
                        }
                        
                        Spacer()
                        
                        Image("heart_selector") // Favorite icon
                            .resizable()
                            .frame(width: 15, height: 15)
                            .opacity(0) // Hidden initially
                    }
                    .padding(10)
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 2)
                )
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            }
        }
        .padding(.bottom, 60) // Ensure button is not overlapped when scrolling
    }.padding(.horizontal,10).padding(.vertical,20)
}
private var button:some View{
    VStack {
        Button(action: {
            print("Move to Cart Pressed")
        }) {
            Text("Move to Cart")
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color("colorPrimary"))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 20) // Adds spacing from bottom
    }
    .background(Color.white)
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
