import SwiftUI

struct OrderDetailView: View {
    var foodName: String = "Chicken Biryani"
      var rating: String = "4.5 rating"
      var shipFrom: String = "Ai Karama, Dubai"
      var shipTo: String = "Oasis, Dubai"
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){

                VStack(spacing: 0) {
                          // **Toolbar**
                          HStack {
                              Button(action: {
                                  // Handle back button action
                              }) {
                                  Image("ic_back") // Replace with custom back icon
                                      .resizable()
                                      .frame(width: 20, height: 20)
                                      .foregroundColor(.black)
                              }

                              VStack(alignment: .leading, spacing: 2) {
                                  Text("Bashabhai")
                                      .font(.headline)
                                      .fontWeight(.bold)
                                      .foregroundColor(.black)
                                      .lineLimit(1)

                                  Text("Oasis")
                                      .font(.caption)
                                      .foregroundColor(.gray)
                                      .lineLimit(1)
                              }
                              .padding(.leading, 8)

                              Spacer()
                          }
                          .padding()
                          .background(Color.white)
                          .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 2)

                          // **Food Card**
                          VStack(alignment: .leading, spacing: 10) {
                              // Food Name & Favorite Icon
                              HStack {
                                  Text(foodName)
                                      .font(.headline)
                                      .fontWeight(.bold)
                                      .foregroundColor(.black)

                                  Spacer()

                                  Image(systemName: "heart.fill") // Replace with custom heart icon
                                      .foregroundColor(.red)
                                      .opacity(1) // Hidden, similar to visibility="gone"
                              }

                              // Rating
                              HStack {
                                  Text(rating)
                                      .font(.subheadline)
                                      .fontWeight(.bold)
                                      .foregroundColor(.black)

                                  Image(systemName: "chevron.down") // Replace with your custom arrow icon
                                      .foregroundColor(Color("colorPrimary"))
                              }

                              // Separator Line
                              Divider()
                                  .background(Color.gray.opacity(0.4))

                              // Shipping Details (From)
                              HStack {
                                  Circle()
                                      .frame(width: 6, height: 6)
                                      .foregroundColor(.gray)

                                  Text("From:")
                                      .font(.footnote)
                                      .foregroundColor(.black)

                                  Text(shipFrom)
                                      .font(.footnote)
                                      .foregroundColor(.black)

                                  Spacer()
                              }

                              // Shipping Details (To)
                              HStack {
                                  Circle()
                                      .frame(width: 6, height: 6)
                                      .foregroundColor(.gray)

                                  Text("To:")
                                      .font(.footnote)
                                      .foregroundColor(.black)

                                  Text(shipTo)
                                      .font(.footnote)
                                      .foregroundColor(.black)

                                  Spacer()
                              }
                          }
                          .padding()
                          .background(Color(.systemGray6)) // Card background color
                          .cornerRadius(14) // Rounded corners
                          .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 2)
                          .padding(.horizontal, 18)
                          .padding(.top, 20) // Adjusted padding for alignment
                          .padding(.bottom, 18)

                    Rectangle()
                            
                        .foregroundColor(.gray.opacity(0.6))
                                .frame(height: 5)
                                .padding(.top, 14)
                    
                      }
                      .edgesIgnoringSafeArea(.top)
                        
                      }

                    
                }
            }

        
    
        struct Orderdetail_view: PreviewProvider {
            static var previews: some View {
                OrderDetailView()
            }
        }
}

