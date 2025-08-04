import SwiftUI

struct FavouriteView: View {

    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    foodview
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.viewfavourite()
        }
        .background(Color(.systemGroupedBackground))
    }

    private var header: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 23, height: 23)
            }

            Text("My Favourite")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.leading, 20)

            Spacer()
        }
    }

    private var foodview: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.favouriteresponse, id: \.addFavId) { item in
                HStack(alignment: .top, spacing: 12) {
                    ZStack(alignment: .bottomLeading) {
                        if let image = imageFromBase64(item.itembo.image) {
                            image
                                .scaledToFill()
                                .frame(width: 120, height: 160)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .cornerRadius(10)
                        } else {
                            Color.gray
                                .frame(width: 120, height: 160)
                        }
                    

                        VStack(alignment: .leading, spacing: 4) {
                            Text("UPTO 23%")
                                .font(.caption2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.black.opacity(0.5))
                                .clipShape(Capsule())

                            Text("Offer")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(6)
                    }
                    .overlay(
                        Image("heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(6),
                        alignment: .topTrailing
                    )

                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.itembo.foodName)
                            .font(.headline)
                            .foregroundColor(.black)
                            .lineLimit(1)

                        Text(item.itembo.decription)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(2)

                        HStack(spacing: 4) {
                            Image("star")
                                .resizable()
                                .frame(width: 14, height: 14)

                            Text("4.5 | 5.0 reviews")
                                .font(.caption)
                                .foregroundColor(.black)
                        }

                        Text("Branch:")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.black)

                        if let restaurant = item.restaurantbo {
                            Text(restaurant.restaurantName)
                                .font(.caption)
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
            }
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
func imageFromBase64(_ base64String: String) -> Image? {
    if let imageData = Data(base64Encoded: base64String),
       let uiImage = UIImage(data: imageData) {
        return Image(uiImage: uiImage)
    }
    return nil
}
