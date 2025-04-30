import SwiftUI

struct TransactionHistoryView: View {
    let imageNames = ["ban", "ban1", "ban2","ban2","ban", "ban1"]
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){

                VStack(alignment: .leading) {
                  
                    HStack {
                        Button(action: {
                            dismiss() // Go back
                        }) {
                            Image("ic_back")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        Text("Transaction History")
                            .font(.system(size: 18))
                            .bold()
                            .padding(.horizontal,30)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal)
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
            }
            .navigationBarBackButtonHidden(true)
        }.onAppear{
            viewModel.transactionhistory()
        }
    }
        struct TransactionHistory_view: PreviewProvider {
            static var previews: some View {
                TransactionHistoryView()
            }
        }
}

