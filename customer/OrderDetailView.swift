import SwiftUI

struct OrderDetailView: View {
    var foodName: String = "Chicken Biryani"
    var rating: String = "4.5 rating"
    var shipFrom: String = "Ai Karama, Dubai"
    var shipTo: String = "Oasis, Dubai"
    @State private var foodCount: Int = 0
    @State private var walletAmount: String = ""
    @State private var showApplyCouponDialog = false
    @State private var naviagte_payment = false
    @Environment(\.presentationMode) var presentationMode // Access presentation mode
    @State private var showPopup = false
    
    @StateObject private var viewModel = HomeviewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // **Toolbar**
               toolbar
                    // **Food Card**
//                    foodcart
            
                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)
                    
                    // **Food List**
                    foodlist
                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)
                    
                    // **Offer & Benefits Section**
                    offer
                    // **Section Divider**
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(height: 5)
                        .padding(.top, 14)
                    
                    // **E-Wallet Section**
                    ewallet
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
                
                paymentmetod
                
               
                
            }
            
            
            if showPopup {
                CancelOrderView(showPopup: $showPopup)
            }
            
            
        }
        .onAppear{
//            viewModel.getfooddetail(foodid: "5275")
//            viewModel.getrestaurantfood()
            viewModel.getcartitem(customerId:UserDefaults.standard.integer(forKey: "customerID") )

        }
        
    }
    
    private var toolbar:some View{
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the current view
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
        
    }
    private var foodcart :some View{
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
        .opacity(0)
    }
    private var foodlist:some View{
        ForEach(viewModel.cartresponse) { cart in
            ForEach(cart.cartItems.indices, id: \.self) { index in
                let item = cart.cartItems[index]
                let product = item.product
                let foodId = product.foodId

                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text(product.foodName)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        if item.quantity > 0 {
                            HStack(spacing: 10) {
                                Button(action: {
                                 
                                }) {
                                    Image("minimize-sign")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }

                                Text("\(item.quantity)")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color("colorPrimary"))

                                Button(action: {
                            
                                }) {
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
                            Button(action: {
                            
                            }) {
                                Text("Add")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color("colorPrimary"), lineWidth: 1))
                            }
                        }

                        Spacer()

                        Text("₹\(item.subTotal, specifier: "%.2f")")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.black)
                    }

                    Divider().background(Color.gray.opacity(0.3))
                }
                .padding(.top, 14)
                .padding(.horizontal)
            }
        }

    }
    private var offer :some View{
        VStack(alignment: .leading, spacing: 14) {
            Text("Offer & Benefits")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 14)
                .padding(.leading, 14)
            
            Divider()
                .frame(height: 2)
                .padding(.horizontal, 12)
            
            VStack {
                HStack {
                    Text("Apply Coupon")
                        .font(.system(size: 13))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        showApplyCouponDialog.toggle() // Show the dialog
                    }) {
                        Text("Apply")
                            .font(.system(size: 13))
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color("colorPrimary")) // Replace with Color("colorPrimary") if needed
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal,10)
            }
            .sheet(isPresented: $showApplyCouponDialog) {
                ApplyCouponView()
                    .presentationDetents([.medium, .large]) // Half-screen by default
                    .presentationDragIndicator(.visible) // Show the drag indicator
            }
        }

    }
    private var ewallet:some View {
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

    }
    private var paymentmetod:some View{
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
                Button(action: {
                    naviagte_payment=true
                }){
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
                }.navigationDestination(isPresented: $naviagte_payment) {
                    PaymentView()
                }
                
                
            }
            .padding(.horizontal, 12)
            
            Button(action: {
                showPopup = true
                viewModel.checkout(orderid:"456")
            }) {
                Text("Checkout")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color("colorPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
            .padding(.horizontal, 10)
            .frame(height: 45)
            .padding(.horizontal, 12)
            
        }
        
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
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
struct ApplyCouponView: View {
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var couponCode = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Enter Coupon Code")
                .font(.headline)
                .padding(.top, 20)

            TextField("Coupon Code", text: $couponCode)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 16)

            Button(action: {
                print("Coupon Applied: \(couponCode)")
                viewModel.applycoupon(coupon:couponCode )
                presentationMode.wrappedValue.dismiss() // Close the sheet
            }) {
                Text("Apply")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue) // Replace with Color("colorPrimary") if needed
                    .cornerRadius(8)
            }
            .padding(.horizontal, 16)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
    }
}



struct CancelOrderView: View {
    @StateObject private var viewModel = HomeviewModel()
    @Binding var showPopup: Bool
    @State private var timerValue: Int = 30
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            // Background overlay
            Color.black.opacity(0.1)
                .onTapGesture {
                    showPopup = false
                }

            VStack(spacing: 12) {
                Image("ic_logo")
                    .resizable()
                    .frame(width: 100, height: 75)
                    .padding(.top, 12)
                
                Text("\(timerValue)")
                    .font(.system(size: 18, weight: .bold))
                
                Text("Seconds Remaining")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
                Text("Cancel Order Now")
                    .font(.system(size: 14, weight: .bold))
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

                Button(action: {
                    showPopup = false
                    viewModel.cancelorder(orderid: "456")
                }) {
                    Text("Cancel Order")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 12)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .frame(width: 300)
            .shadow(radius: 10)
        }
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerValue > 0 {
                timerValue -= 1
            } else {
                showPopup = false
                timer?.invalidate()
            }
        }
    }
}

