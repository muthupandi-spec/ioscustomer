import SwiftUI

struct WalletView: View {
    @State private var navigate_wallet = false
    @State private var navigate_Topup = false
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading) {
                    
                  header
                    card
                    
                    Transactionheader
                  TransactionHistory
                    
                    
                    
                }
            }
            
        }.onAppear{
            viewModel.transactionhistory()
        }
        
      
        
    }
    private var header:some View{
        HStack {
            Image("ic_logo")
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.top, 12)
            
            Spacer() // Pushes text to center
            
            Text("Wallet")
                .font(.headline)
            
            Spacer() // Balances the text in the center
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }
    private var card :some  View{
        ZStack {
            Image("card") // Background Image
                .resizable()
                .scaledToFill()
                .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: 10) {
                // Card Name & Card Type
                HStack {
                    Text("MuthuPandi R")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("VISA")
                        .font(.system(size:19))
                        .foregroundColor(.white)
                        .opacity(0) // Hidden as per Android layout
                }
                
                // Card Number
                Text("**** **** **** 0123")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                
                Spacer()
                
                // Balance Section
                VStack(alignment: .leading) {
                    Text("Your Balance")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text("$9,379")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Top Up Button
                Button(action:{
                    navigate_Topup=true
                }){
                    HStack {
                        Image(systemName: "arrow.down.circle.fill") // Replace with appropriate image asset
                            .resizable()
                            .frame(width: 16, height: 16)
                        
                        Text("Top Up")
                            .font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(Color.white)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }.fullScreenCover(isPresented: $navigate_Topup) {
                    TopUpView()
                }
            
            }
            .padding()
        }
        .frame(height: 220)
        .cornerRadius(25)
        .shadow(radius: 5)
        .padding(.horizontal, 20)
    }
    private var TransactionHistory :some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(0..<5, id: \.self) { _ in
                    
                    HStack(spacing: 10) {
                        // Food Image with Circular Card
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 52, height: 52)
                                .shadow(radius: 1)
                            
                            Image("burger") // Image from Assets
                                .resizable()
                                .scaledToFit()
                                .frame(width: 52, height: 52)
                                .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Big Garden Salad")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.black)
                            
                            HStack(spacing: 5) {
                                Text("Dec 31, 2023")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                
                                Rectangle()
                                    .frame(width: 1, height: 12)
                                    .foregroundColor(.gray)
                                
                                Text("16 : 00 PM")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("20$")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.black)
                            
                            HStack(spacing: 4) {
                                Text("Orders")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                
                                Image("arrow_up_square") // Image from Assets
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                        }
                    }
                    .padding()
                }
            }
        }

    }
    private var Transactionheader:some View{
        HStack {
            Text("Transaction History")
                .bold()
                .foregroundColor(.black)
            
            Spacer() // Pushes "See All" to the right
            Button(action:{
                navigate_wallet=true
            }){
                Text("See All")
                    .bold()
                    .foregroundColor(Color("colorPrimary"))
            }.fullScreenCover(isPresented:$navigate_wallet){
                TransactionHistoryView()
            }
            
        }
        .padding()
    }
    struct Wallet_view: PreviewProvider {
        static var previews: some View {
            WalletView()
        }
    }
}

