import SwiftUI

struct ShopDetailView: View {
    @State private var isVeg = false
    @State private var isNonVeg = false
    let imageNames = ["ban", "ban1", "ban2"]
    @State private var naviagte_orderdetail = false
    @State private var foodCount: Int = 0
    let menuData = [
        ("Biryani", ["Chicken Biryani", "Mutton Biryani", "Veg Biryani"]),
        ("Pizza", ["Cheese Pizza", "Pepperoni Pizza"]),
        ("Drinks", ["Coke", "Pepsi", "Lemonade"])
    ]
    @StateObject private var viewModel = HomeviewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                headerview
                middleview
                button
                
                
                
            }
            .padding(.top, 12)
            .edgesIgnoringSafeArea(.top)
        }.onAppear{
            viewModel.getorderdetail(orderid: "7678")
            viewModel.getshopfooditem()
            viewModel.getbannner()
            viewModel.getforyou()
        }
        
        
        
        
        
    }
    
    struct Shopdetail_view: PreviewProvider {
        static var previews: some View {
            ShopDetailView()
        }
    }
    private var headerview :some View{
        VStack(alignment: .leading)  {
            
            Color("AliceBlue")
            HStack{
                Image("ic_back")
                    .resizable()
                    .frame(width: 23, height: 23)
                Text("Basha Restaurant")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal,10)
            }
            .padding(.horizontal,10)
            .padding(.top, 50)
            
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("ic_biryani")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Biryani")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("$12.99")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("Delicious biryani with rich spices")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("4.2 | 4.5 reviews")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white))
                .shadow(radius: 2)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text("Ship From: Periyar Bus Stand")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text("Delivering To: Maatuthavani, Madurai")
                        .font(.caption)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .shadow(radius: 2)
            .padding(.horizontal)
            
        }   .edgesIgnoringSafeArea(.top)
    }
    private var middleview:some View{
        VStack(spacing: 12) {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(.leading, 18)
                
                TextField("Search for dish", text: .constant(""))
                    .font(.system(size: 11))
                    .padding(.vertical, 8)
                
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 12, height: 16)
                    .padding(.trailing, 18)
            }
            .frame(height: 40)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal, 18)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 100, height: 160)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            HStack {
                Text("Veg")
                    .font(.system(size: 13))
                
                Toggle("", isOn: $isVeg)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: Color.green))
                    .onChange(of: isVeg) { _ in
                        viewModel.productchannge(type: "veg")                            }
                
                Spacer().frame(width: 24)
                
                Text("Non-Veg")
                    .font(.system(size: 13))
                
                Toggle("", isOn: $isNonVeg)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: Color.red))
                    .onChange(of: isNonVeg) { _ in
                        viewModel.productchannge(type: "nonveg")
                    }
            }
            .padding(.horizontal, 18)
            
            
            Divider().background(Color.gray)
            
            // For You Section
            Text("For You")
                .font(.system(size: 15, weight: .bold))
                .padding(.leading, 18)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { _ in
                        
                        ZStack {
                            // Background Image
                            
                            Image("ic_bir")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 260, height: 260)
                                .clipped()
                                .overlay(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .cornerRadius(14)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "leaf.fill") // Placeholder for catIcon
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                        .opacity(0) // Initially hidden
                                    Spacer()
                                }
                                
                                Text("Basmathi Biryani")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.top, 6)
                                
                                
                                
                                Spacer()
                                
                                HStack {
                                    Text("40$")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.top, 2)
                                    Spacer()
                                    if foodCount == 0 {
                                        Button(action: {
                                            foodCount = 1
                                        }) {
                                            Text("ADD")
                                                .font(.subheadline.bold())
                                                .foregroundColor(.black)
                                                .frame(width: 80, height: 32)
                                                .background(Color.white)
                                                .cornerRadius(7)
                                        }
                                    } else {
                                        HStack {
                                            Button(action: {
                                                if foodCount > 0 { foodCount -= 1 }
                                            }) {
                                                Image(systemName: "minus")
                                                    .foregroundColor(.black)
                                                    .padding()
                                            }
                                            
                                            Text("\(foodCount)")
                                                .font(.subheadline.bold())
                                                .foregroundColor(.black)
                                            
                                            Button(action: {
                                                foodCount += 1
                                            }) {
                                                Image(systemName: "plus")
                                                    .foregroundColor(.black)
                                                    .padding()
                                            }
                                        }
                                        .frame(width: 80, height: 32)
                                        .background(Color.white)
                                        .cornerRadius(7)
                                    }
                                }
                                .padding(.bottom, 14)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                        }
                        .frame(width: 260, height: 260)
                        .cornerRadius(14)
                        .shadow(radius: 2)
                        
                    }
                }}
            .padding(.horizontal,10)
            
            
            Divider().background(Color.gray)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(menuData, id: \.0) { section in
                        MenuItemView(title: section.0, subItems: section.1)
                    }
                }
            }
            .background(Color.white)
        }
        
    }
    private var button:some View{
        Button(action: {
            naviagte_orderdetail=true
            viewModel.viewcart(orderid: "456")
        }){
            VStack {
                HStack {
                    Text("Items: 2")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.white)
                    
                    // Vertical Divider
                    Rectangle()
                        .frame(width: 2, height: 10)
                        .foregroundColor(.white)
                    
                    // Overall Price
                    Text("23$")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    
                    HStack {
                        Text("View Cart")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                // Extra Charge
                HStack {
                    Text("2$")
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 8)
            }
            .background(Color("colorPrimary"))
            .cornerRadius(14)
            .padding(.horizontal, 10)
            .padding(.bottom, 14)
            .shadow(radius: 4)
        }.navigationDestination(isPresented: $naviagte_orderdetail) {
            OrderDetailView()
        }
    }
    
}

struct MenuItemView: View {
    let title: String
    let subItems: [String]
    @State private var foodCount: Int = 0
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading, 14)
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.black)
                    .padding(.trailing, 14)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
            .padding(.vertical, 14)
            .background(Color.white)
            
            if isExpanded {
                VStack(spacing: 10) {
                    ForEach(subItems, id: \.self) { item in
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                Image("ic_biryani")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text("Thalapakatu biryani")
                                    .font(.system(size: 13, weight: .bold))
                                
                                HStack(spacing: 8) {
                                    Text("20$")
                                        .font(.system(size: 13, weight: .bold))
                                    
                                    Text("30$")
                                        .font(.system(size: 11))
                                        .strikethrough()
                                        .foregroundColor(.gray)
                                }
                                
                                HStack {
                                    Image("star")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("4.2")
                                        .font(.system(size: 12, weight: .bold))
                                }
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image("ic_bir")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(14)
                                
                                if foodCount == 0 {
                                    Button(action: {
                                        foodCount = 1
                                    }) {
                                        Text("ADD")
                                            .font(.system(size: 13, weight: .bold))
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 7)
                                                    .stroke(Color("colorPrimary"), lineWidth: 1)
                                            )
                                    }
                                    .frame(width: 120, height: 32)
                                } else {
                                    HStack {
                                        Button(action: {
                                            if foodCount > 0 { foodCount -= 1 }
                                        }) {
                                            Image("minimize-sign")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        
                                        Text("\(foodCount)")
                                            .font(.system(size: 13, weight: .bold))
                                            .foregroundColor(.black)
                                        
                                        Button(action: {
                                            foodCount += 1
                                        }) {
                                            Image("add")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                    .frame(width: 120, height: 32)
                                    .background(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color("colorPrimary"), lineWidth: 1)
                                    )
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("background"))
                        )
                        .padding()
                        
                        Divider()
                    }
                }
                .padding(.vertical, 10)
                
            }
            
            // Bottom View (Like the separator in your Android XML)
            Color.gray.opacity(0.2)
                .frame(height: 8)
        }
    }
}
