import SwiftUI

struct NotificationView: View {
    let imageNames = ["ban", "ban1", "ban2","ban2","ban", "ban1"]
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            
            
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
//                Text("Error: \(errorMessage)")
//                    .foregroundColor(.red)
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading) {
                      headerview
                        notification
                    
                    }
                }

            } else{
                ScrollView(.vertical, showsIndicators: false){

                    VStack(alignment: .leading) {
                      headerview
                        notification
                       
                    }
                }

            }
            

        }.onAppear{
            viewModel.getnotification()
        }
        
    }
    private var headerview: some View {
        HStack {
            Button(action: {
                dismiss() // 👈 Dismiss the current view
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 23, height: 23)
            }

            Text("Notification")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal, 30)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }
    private var notification:some View{
        VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<5, id: \.self) { _ in
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 10) {
                        // Profile Image with Border
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 36, height: 36)
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            
                            Image("ic_logo")
                                .resizable()
                                .frame(width: 26, height: 26)
                        }
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Orders Successful!")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(Color.black)
                            
                            HStack(spacing: 5) {
                                Text("19 Dec 2022")
                                    .font(.system(size: 9))
                                    .foregroundColor(Color.gray)
                                
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 2, height: 9)
                                
                                Text("19:19 PM")
                                    .font(.system(size: 9))
                                    .foregroundColor(Color.gray)
                            }
                        }
                        
                        Spacer()
                        
                        // New Notification Badge (Initially Hidden)
                        Text("New")
                            .font(.system(size: 6))
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .opacity(1) // Change to 1 if you want to show
                    }
                  
                    Text("On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will")
                        .font(.system(size: 9))
                        .foregroundColor(Color.gray)
                        .padding(.vertical, 10)
                        
                }
                .padding(10) // Adds padding inside VStack
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal, 10) // Adds margin on both left & right
                .padding(.vertical, 5) // Adds margin on top & bottom
            }
        }

    }
        struct Notification_view: PreviewProvider {
            static var previews: some View {
                NotificationView()
            }
        }
}



