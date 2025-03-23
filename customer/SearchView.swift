import SwiftUI

struct Searchview: View {
    let varieties = [
        ("ic_biryani", "Biryani"),
        ("ic_biryani", "Pizza"),
        ("ic_biryani", "Burger"),
        ("ic_biryani", "Noodles"),
        ("ic_biryani", "Dosa"),
        ("ic_biryani", "Pasta"),
        ("ic_biryani", "Mutton"),
    ]
    var body: some View {
        NavigationStack{
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
                    

                    
                }
            }

        }
    }
        struct Search_view: PreviewProvider {
            static var previews: some View {
                Searchview()
            }
        }
}

