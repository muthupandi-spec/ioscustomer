import SwiftUI

struct OrderDetailpageView: View {
    let imageNames = ["ban", "ban1", "ban2","ban2","ban", "ban1"]
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){

                VStack(alignment: .leading) {
                  
                    HStack {
            
                        Text("Order_ID:#65765785")
                            .font(.system(size: 18))
                            .bold()
                            .padding(.horizontal,30)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
             
                    VStack(alignment: .leading, spacing: 10) {
                              // Image & Order Details
                              HStack(alignment: .top, spacing: 10) {
                                  Image("burger") // Replace with actual image asset
                                      .resizable()
                                      .scaledToFill()
                                      .frame(width: 80, height: 80)
                                      .clipShape(RoundedRectangle(cornerRadius: 10))

                                  VStack(alignment: .leading, spacing: 5) {
                                      Text("Burger")
                                          .font(.headline)
                                          .foregroundColor(.black)

                                      Text("Bash Bhai Restaurant")
                                          .font(.subheadline)
                                          .foregroundColor(.gray)

                                      HStack {
                                          Text("2")
                                              .font(.caption)
                                              .foregroundColor(.gray)

                                          Divider()
                                              .frame(height: 12)
                                              .background(Color.gray)

                                          Text("3 km")
                                              .font(.caption)
                                              .foregroundColor(.gray)
                                      }
                                  }
                                  Spacer()
                                  
                                  VStack(alignment: .trailing) {
                                      Text("$20")
                                          .font(.headline)
                                          .foregroundColor(.green)

                                      Text("Ordered")
                                          .font(.caption)
                                          .padding(.horizontal, 10)
                                          .padding(.vertical, 3)
                                          .background(Color("colorPrimary"))
                                          .foregroundColor(.white)
                                          .cornerRadius(5)
                                  }
                              }

                              Divider()

                              HStack {
                                  Image(systemName: "mappin.circle") // Location icon
                                      .foregroundColor(.red)

                                  Text("Oasis Dubai")
                                      .font(.footnote)
                                      .foregroundColor(.gray)
                                  Spacer()
                              }

                              Button(action: {
                                  print("Help Button Clicked")
                                 callNumber(phoneNumber: "98767998")
                              }) {
                                  Text("Help")
                                      .frame(maxWidth: .infinity)
                                      .padding()
                                      .background(Color("colorPrimary"))
                                      .foregroundColor(.white)
                                      .cornerRadius(8)
                              }
                          }
                          .padding()
                          .background(
                              RoundedRectangle(cornerRadius: 15)
                                  .fill(Color.white)
                                  .shadow(color: Color.gray.opacity(0.3), radius: 5)
                          )
                          .padding(.horizontal, 20)
                    VStack(alignment: .leading, spacing: 10) {
                                
                                HStack {
                                    Text("Order Details")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down") // Arrow down icon
                                        .foregroundColor(.gray)
                                }
                                
                                Divider()
                                
                        // Manually adding ForEach
                                    VStack(alignment: .leading, spacing: 5) {
                                        ForEach(0..<3, id: \.self) { index in
                                            if index == 0 {
                                                HStack{ Text("Burger")
                                                    Spacer()
                                                    Text("2 Qty")}
                                               
                                            } else if index == 1 {
                                                HStack{ Text("Pizza")
                                                    Spacer()
                                                    Text("2 Qty")}                                            } else if index == 2 {
                                                        HStack{ Text("Fries")
                                                            Spacer()
                                                            Text("4 Qty")}
                                            }
                                        }
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Divider()
                                
                                HStack {
                                    Text("Delivery Charge")
                                    Spacer()
                                    Text("$5.00")
                                }
                                
                                HStack {
                                    Text("Promo Code")
                                    Spacer()
                                    Text("GET10")
                                        .foregroundColor(.blue)
                                }
                                
                                HStack {
                                    Text("Admin Charge")
                                    Spacer()
                                    Text("$2.00")
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Total")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("$20.00")
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
                            .padding(.horizontal, 20)

                    
                }.padding()
            }

        }
        .onAppear{
            viewModel.getorderdetail(orderid: "768")
        }
    }
        struct OrderDetailpage_view: PreviewProvider {
            static var previews: some View {
                OrderDetailpageView()
            }
        }
    func callNumber(phoneNumber: String) {
           if let phoneURL = URL(string: "tel://\(phoneNumber)"),
              UIApplication.shared.canOpenURL(phoneURL) {
               UIApplication.shared.open(phoneURL)
           } else {
               print("Can't make a call on this device")
           }
       }
}

