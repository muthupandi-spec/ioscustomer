import SwiftUI

struct OrderDetailView: View {
    var foodName: String = "Chicken Biryani"
    var rating: String = "4.5 rating"
    var shipFrom: String = "Ai Karama, Dubai"
    var shipTo: String = "Oasis, Dubai"
    @State private var foodCount: Int = 0
    @State private var walletAmount: String = ""

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                
                    // **Toolbar**
                    HStack {
                        Button(action: {
                            // Handle back button action
                        }) {
                            Image("ic_back") // Replace with a valid asset name
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
                        HStack {
                            Text(foodName)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .opacity(1)
                        }
                        
                        HStack {
                            Text(rating)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color("colorPrimary"))
                        }
                        
                        Divider().background(Color.gray.opacity(0.4))
                        
                        HStack {
                            Circle().frame(width: 6, height: 6).foregroundColor(.gray)
                            Text("From:").font(.footnote).foregroundColor(.black)
                            Text(shipFrom).font(.footnote).foregroundColor(.black)
                            Spacer()
                        }
                        
                        HStack {
                            Circle().frame(width: 6, height: 6).foregroundColor(.gray)
                            Text("To:").font(.footnote).foregroundColor(.black)
                            Text(shipTo).font(.footnote).foregroundColor(.black)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 2)
                    .padding(.horizontal, 18)
                    .padding(.top, 20)
                    .padding(.bottom, 18)
                    
                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)

                    // **Food List**
                    ForEach(0..<3, id: \.self) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Biryani")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                if foodCount > 0 {
                                    HStack(spacing: 10) {
                                        Button(action: { foodCount -= 1 }) {
                                            Image("minimize-sign")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                        }
                                        
                                        Text("\(foodCount)")
                                            .font(.system(size: 13, weight: .bold))
                                            .foregroundColor(Color("colorPrimary"))
                                        
                                        Button(action: { foodCount += 1 }) {
                                            Image("add")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                        }
                                    }
                                    .padding(2)
                                    .background(RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color("colorPrimary"), lineWidth: 1))
                                } else {
                                    Button(action: { foodCount = 1 }) {
                                        Text("Add")
                                            .font(.system(size: 13, weight: .bold))
                                            .foregroundColor(.black)
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 7)
                                                .stroke(Color("colorPrimary"), lineWidth: 1))
                                    }
                                }
                                
                                Spacer()
                                
                                Text("10$")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            Divider().background(Color.gray.opacity(0.3))
                        }
                        .padding()
                    }

                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)

                    // **Offer & Benefits Section**
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Offer & Benefits")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 14)
                            .padding(.leading, 14)

                        Divider()
                            .frame(height: 2)
                            .padding(.horizontal, 12)

                        HStack {
                            Text("Apply Coupon")
                                .font(.system(size: 13))
                                .foregroundColor(.black)
                                .padding(.leading, 14)

                            Spacer()

                            Text("Remove")
                                .font(.system(size: 13))
                                .foregroundColor(.black)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 12)
                                .background(Color("colorPrimary"))
                                .cornerRadius(10)
                        }
                        .padding(.vertical, 8)
                    }

                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)

                    // **E-Wallet Section**
                    VStack(alignment: .leading, spacing: 10) {
                        Text("E-Wallet")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 14)
                            .padding(.leading, 14)

                        HStack {
                            Text("Available Wallet Amount")
                                .font(.system(size: 13))
                                .foregroundColor(.black)

                            Text("$100")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 14)

                        HStack {
                            TextField("Enter Wallet Amount", text: $walletAmount)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(height: 30)
                                .font(.system(size: 11))
                                .padding(.leading, 12)

                            Button(action: {}) {
                                Text("Apply")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 30)
                                    .background(Color("colorPrimary"))
                                    .cornerRadius(4)
                            }
                            .padding(.trailing, 14)
                        }
                        .padding(.horizontal, 14)
                        .padding(.bottom, 14)
                    }
                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)
                    VStack(alignment: .leading, spacing: 14) {
                               Text("Bill Details")
                                   .font(.system(size: 13, weight: .bold))
                                   .foregroundColor(.black)
                                   .padding(.leading, 14)

                               DottedDivider()
                        BillRow(title: "GST & Restaurant Charges", value: "0.5$")
                        BillRow(title: "Delivery Fee", value: "2.0$")
                        BillRow(title: "Wallet", value: "-5.0$")
                        BillRow(title: "To Pay", value: "10.3$", isTotal: true)
                           }
                           .padding(.vertical, 14)
                                    }
                // **Section Divider**
                Rectangle()
                    .foregroundColor(.gray.opacity(0.6))
                    .frame(height: 5)
                    .padding(.top, 14)
                VStack(spacing: 12) {
                            
                            // Payment Method Section
                            HStack(spacing: 10) {
                                
                                // Payment Card
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                        .frame(width: 56, height: 56)
                                    
                                    Image("wallet") // Replace with your asset
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Pay Using")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                    
                                    Text("Cash on Delivery")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                // Change Payment Option
                                HStack {
                                    Text("Change")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("colorPrimary"))
                                    
                                    Image("right-arrow") // Replace with your asset
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(Color("colorPrimary"))
                                }
                            }
                            .padding(.horizontal, 12)
                            
                            // Slide to Checkout Button
                            SlideButton(text: "Checkout", action: {
                                print("Order placed!")
                            })
                            .frame(height: 45)
                            .padding(.horizontal, 12)
                            
                        }
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(14)
                        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)

            }
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}
struct BillRow: View {
    var title: String
    var value: String
    var isTotal: Bool = false

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 13))
                .foregroundColor(.black)

            Spacer()

            Text(value)
                .font(.system(size: 13, weight: isTotal ? .bold : .regular))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 14)
    }
}
struct DottedDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.clear)
            .background(
                Image("dotted_line")
                    .resizable()
                    .scaledToFill()
            )
            .padding(.horizontal, 12)
    }
}
// Custom Slide Button
struct SlideButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color("colorPrimary"))
            
            HStack {
                Text(text)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Image("slide") // Replace with your asset
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 10)
            }
        }
        .frame(height: 45)
        .onTapGesture {
            action()
        }
    }
}
