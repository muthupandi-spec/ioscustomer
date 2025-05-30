import SwiftUI

struct TrackOrderView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                   header
                    
                    MapView()
                        .frame(height: 300)
                        .edgesIgnoringSafeArea(.top)
                        .offset(y: -32) // Equivalent to marginBottom -32dp
                 trackorder
                }
            }

        }
    
        
    }
    private var header :some  View{
        HStack {
            Button(action: {
                // Handle back button action
            }) {
                Image("ic_back") // Replace with your back arrow asset
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text("TrackOrderView")
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                // Handle edit action
            }) {
                Image("edit") // Replace with your edit icon asset
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .opacity(0) // Initially hidden
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
    private var trackorder :some View{
        VStack{
        
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Circle().fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(Image(systemName: "checkmark.circle").resizable().scaledToFit().frame(width: 20, height: 20))
                    Spacer()
                    Circle().fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(Image(systemName:"shippingbox").resizable().scaledToFit().frame(width: 20, height: 20))
                    Spacer()
                    Circle().fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(Image(systemName:"checkmark.seal.fill").resizable().scaledToFit().frame(width: 20, height: 20))
                    Spacer()
                    Circle().fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(Image("box").resizable().scaledToFit().frame(width: 20, height: 20))
                }
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    Rectangle().fill(Color.gray.opacity(0.3)).frame(height: 2)
                    Rectangle().fill(Color.gray.opacity(0.3)).frame(height: 2)
                    Rectangle().fill(Color.gray.opacity(0.3)).frame(height: 2)
                }
                .frame(height: 2)
                .padding(.horizontal)
                
                HStack {
                    Text("Order Status")
                        .font(.system(size: 13))
                    Spacer()
                    Text("10.22 PM")
                        .font(.system(size: 12))
                }
                .padding(.horizontal)
                
                Text("Status Description")
                    .font(.system(size: 11))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Button(action: {}) {
                    Text("More Track Details")
                        .font(.system(size: 11))
                        .foregroundColor(Color.blue)
                        .padding()
                        .frame(width: 120, height: 28)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.3)))
                }
                .padding(.horizontal)
            }

            HStack(alignment: .top, spacing: 10) {
                       // Food Image Card
                       ZStack {
                           Image("food1")
                               .resizable()
                               .scaledToFill()
                               .frame(width: 80, height: 80)
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                       }
                       .frame(width: 80, height: 80)
                       .background(Color.white)
                       .cornerRadius(10)
                       .shadow(radius: 2)
                       
                       VStack(alignment: .leading, spacing: 4) {
                           Text("Biryani")
                               .font(.system(size: 13, weight: .bold))
                               .foregroundColor(Color.black)
                           
                           HStack(spacing: 5) {
                               Text("2 count")
                                   .font(.system(size: 10))
                                   
                               Rectangle()
                                   .frame(width: 1, height: 12)
                                   .foregroundColor(Color.gray)
                               
                               Text("2km")
                                   .font(.system(size: 10))
                           }
                           
                           HStack {
                               Text("AED 5")
                                   .font(.system(size: 13, weight: .bold))
                                   .foregroundColor(Color.black)
                               
                               Text("Delivered")
                                   .font(.system(size: 10))
                                   .foregroundColor(Color.white)
                                   .padding(.horizontal, 10)
                                   .padding(.vertical, 2)
                                   .background(Color.green)
                                   .cornerRadius(5)
                           }
                       }
                       Spacer()
                   }
            .padding(10)
            .background(Color.white)
                   .cornerRadius(10)
                   .shadow(radius: 2)
                   .padding(.horizontal,2)
                   .padding()
        }
        .padding(.vertical,30)
        .background(Color.white)
               .cornerRadius(10)
               .shadow(radius: 2)
               .padding(.horizontal,2)
               .padding()
    }
}

struct TrackOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TrackOrderView()
    }
}
