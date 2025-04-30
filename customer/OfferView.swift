import SwiftUI

struct OfferView: View {
    let imageNames = ["ban", "ban1", "ban2", "ban2", "ban", "ban1"]
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        headerview
                        bannnerview(imageNames: imageNames)
                    }
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        headerview
                        bannnerview(imageNames: imageNames)
                    }
                }
            }
        }.onAppear{
            viewModel.getoffer()
        }
    }

    private var headerview: some View {
        HStack {
            Button(action: {
                dismiss() // Go back
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            

            Text("Special Offers")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal, 30)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }

    private func bannnerview(imageNames: [String]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 160)
                        .clipped()
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct Offer_view: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
