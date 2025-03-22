import SwiftUI

struct OfferView: View {
    let imageNames = ["ban", "ban1", "ban2","ban2","ban", "ban1"]

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){

            VStack(alignment: .leading) {
              
                HStack {
                    Image("ic_back")
                        .resizable()
                        .frame(width: 23, height: 23)
                    
                    Text("Special Offers")
                        .font(.system(size: 18))
                        .bold()
                        .padding(.horizontal,30)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
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
                    .padding(.horizontal,10)
                }

                
            }
        }
    }
        struct Offer_view: PreviewProvider {
            static var previews: some View {
                OfferView()
            }
        }
}

