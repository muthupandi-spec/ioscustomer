import SwiftUI

struct OrderDetailpageView: View {
    var order: ActiveOrderResponsemodel

       var body: some View {
           // Extract first order item
           let firstItem = order.orderItems.first
           let product = firstItem?.product
           let foodName = product?.foodName ?? "Item"
           let category = product?.catagorybo?.catagory ?? "Restaurant"
           let quantity = firstItem?.quantity ?? 1
           let image = product.flatMap { imageFromBase64($0.image) }

           NavigationStack {
               ScrollView(.vertical, showsIndicators: false) {
                   VStack(alignment: .leading) {

                       // Order ID
                       HStack {
                           Text("Order_ID: #\(order.orderId)")
                               .font(.system(size: 18))
                               .bold()
                               .padding(.horizontal, 30)
                               .foregroundColor(.black)
                           Spacer()
                       }

                       // Main Card
                       VStack(alignment: .leading, spacing: 10) {
                           HStack(alignment: .top, spacing: 10) {
                               if let image = image {
                                   Image(uiImage: image)
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: 80, height: 80)
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                               } else {
                                   Color.gray
                                       .frame(width: 80, height: 80)
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                               }

                               VStack(alignment: .leading, spacing: 5) {
                                   Text(foodName)
                                       .font(.headline)
                                       .foregroundColor(.black)

                                   Text(category)
                                       .font(.subheadline)
                                       .foregroundColor(.gray)

                                   HStack {
                                       Text("\(quantity) Qty")
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
                                   Text("₹\(order.totalAmount, specifier: "%.2f")")
                                       .font(.headline)
                                       .foregroundColor(.green)

                                   Text(order.orderStatus)
                                       .font(.caption)
                                       .padding(.horizontal, 10)
                                       .padding(.vertical, 3)
                                       .background(Color("colorPrimary"))
                                       .foregroundColor(.white)
                                       .cornerRadius(5)
                               }
                           }

                        Divider()

                        // Delivery Location
                        HStack {
                            Image(systemName: "mappin.circle")
                                .foregroundColor(.red)

                            Text(order.city)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                        }

                        // Help Button
                        Button(action: {
                            callNumber(phoneNumber: order.mobileNumber)
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

                    // Order Details
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Order Details")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }

                        Divider()

                        // Item List
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(order.orderItems, id: \.orderItemId) { item in
                                HStack {
                                    Text(item.foodName)
                                    Spacer()
                                    Text("\(item.quantity) Qty")
                                }
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)

                        Divider()

                        HStack {
                            Text("Delivery Charge")
                            Spacer()
                            Text("₹5.00")
                        }

                        HStack {
                            Text("Promo Code")
                            Spacer()
                            Text("promoCode")
                                .foregroundColor(.blue)
                        }

                        HStack {
                            Text("Admin Charge")
                            Spacer()
                            Text("₹2.00")
                        }

                        Divider()

                        HStack {
                            Text("Total")
                                .fontWeight(.bold)
                            Spacer()
                            Text("₹\(order.totalAmount, specifier: "%.2f")")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                    .padding(.horizontal, 20)

                }
                .padding()
            }
        }
    }
}
func callNumber(phoneNumber: String) {
    if let phoneURL = URL(string: "tel://\(phoneNumber)"),
       UIApplication.shared.canOpenURL(phoneURL) {
        UIApplication.shared.open(phoneURL)
    }
}
