import SwiftUI

struct TrackMapView: View {
    @State private var showLoader = true // Assuming you want to start with the loader

    var body: some View {
        ZStack(alignment: .center) {
            MapView()
                .edgesIgnoringSafeArea(.top) // To make map full screen
                .padding(.bottom, -18) // Adjust to match your XML layout

            TrackDialogView()
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                )
                .padding(.bottom, 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

           
        }
        .onAppear {
            // Simulate loading completion (replace with your actual loading logic)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 2 seconds delay for demonstration
                showLoader = false
            }
        }
    }
}



struct TrackDialogView: View {
    var body: some View {
        VStack(spacing: 0) {
            headerView
            Divider()
                .background(Color(.lightGray))
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
            orderStatusView
                .padding(.bottom, 10)
            orderIDCardView
        }
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .padding(.bottom, 0)
    }

    private var headerView: some View {
        HStack {
            Text("Order ID")
                .font(.system(size: 14))
                .foregroundColor(.black)
            Text("#496456")
                .font(.system(size: 14))
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }

    private var orderStatusView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                orderStatusCircles
                Spacer()
                Text("10.22 PM")
                    .font(.system(size: 12))
            }
            Text("Order Status Header")
                .font(.system(size: 13))
            Text("Order Status Description")
                .font(.system(size: 11))
                .lineLimit(2)
            Button(action: {}) {
                Text("More Track Details")
                    .font(.system(size: 11))
                    .foregroundColor(Color("colorPrimary"))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color("button_alter_light"))
            )
           

        }
    }

    private var orderStatusCircles: some View {
        HStack(spacing: 0) {
            circleView(imageName: "conform")
            horizontalLine
            circleView(imageName: "packed")
            horizontalLine
            circleView(imageName: "delivery")
            horizontalLine
            circleView(imageName: "delivered")
        }
    }

    private func circleView(imageName: String) -> some View {
        Circle()
            .fill(Color(.lightGray))
            .frame(width: 32, height: 32)
            .overlay(
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            )
    }

    private var horizontalLine: some View {
        Rectangle()
            .fill(Color(.lightGray))
            .frame(height: 2)
            .frame(maxWidth: .infinity, alignment: .center)
    }

    private var orderIDCardView: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white)
            .shadow(radius: 1)
            .overlay(
                HStack(spacing: 10) {
                    Image("food1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Biryani")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color(.black).opacity(0.8))
                        Text("2 count")
                            .font(.system(size: 10))
                            .foregroundColor(Color(.gray))
                        HStack {
                            Text("AED 5")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.black)
                            Text("Delivered")
                                .font(.system(size: 10))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color("text_view_with_bgcolor"))
                                )
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding(10)
            )
    }
}


struct TrackMapView_Previews: PreviewProvider {
    static var previews: some View {
        TrackMapView()
    }
}
