import SwiftUI
import MapKit

struct TrackOrderView: View {
    @StateObject private var viewModel = MapViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            // ✅ Map that supports overlays (with polyline)
            MapViewRepresentable(viewModel: viewModel)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {

                // 🔹 Custom Top Bar
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }

                    Text("Track Order View")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 8)

                    Spacer()
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 40)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .background(
                    Color.white.opacity(0.8)
                        .blur(radius: 10)
                        .shadow(radius: 3)
                )

                Spacer()

                // 🔹 Button to draw the route
                Button(action: {
                 
                }) {
                    Text("Draw Bus Route")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(radius: 4)
                }
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            viewModel.setupLocationManager()
            viewModel.fetchTrackOrder(deliveryboyid: UserDefaults.standard.integer(forKey: "deliveryid"))
        }
        if viewModel.currentRoute != nil {
                       // Optional: You can overlay the polyline if needed
                       RoutePolylineView(route: viewModel.currentRoute!)
                   }
    }
}


