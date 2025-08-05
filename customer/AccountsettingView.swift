import SwiftUI

struct AccountsettinngView: View {
    @State private var showLogoutSheet = false
    @State private var showDeleteSheet = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Back Button & Title
               header
                
                // Logout Button
               logoutview
                // Remove Account Button
              deleteview
                
                
                
                
                
                Spacer() // Pushes everything to the top
            }
            .frame(maxWidth: .infinity, alignment: .topLeading) // Align to top
            .navigationBarBackButtonHidden(true)

        }
       
    }
    private var logoutview:some View{
        Button(action: {
           showDeleteSheet=true
        }) {
            HStack {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("Logout")
                    .foregroundColor(.black)
                    .font(.body)
                
                Spacer()
                
                Image("right-arrow")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }.sheet(isPresented: $showLogoutSheet) {
            LogoutConfirmationView()
        }
        .padding(.horizontal, 18)
        .padding(.top, 12)
        
    }
    private var deleteview:some View{
        Button(action: {
           showDeleteSheet=true
        }) {
            HStack {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("Remove Account")
                    .foregroundColor(.black)
                    .font(.body)
                
                Spacer()
                
                Image("right-arrow")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }.sheet(isPresented: $showDeleteSheet) {
            DeleteView()
        }
        .padding(.horizontal, 18)
        .padding(.top, 12)
    }
    private var header:some View{ HStack {
        Button(action: {
dismiss()                    }) {
            Image("ic_back")
                .resizable()
                .frame(width: 20, height: 20)
        }
        
        Text("Account Settings")
            .font(.headline)
            .foregroundColor(.black)
        
        Spacer()
    }
    .padding(.top, 18)
    .padding(.leading, 18)
        
    }
    struct LogoutConfirmationView: View {
        @Environment(\.dismiss) var dismiss // To close the sheet
        @StateObject private var viewModel = HomeviewModel()

        var body: some View {
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(radius: 5)
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea(edges: .bottom)
                    
                    VStack(spacing: 16) {
                        // Top Divider (Small line)
                        Rectangle()
                            .frame(width: 30, height: 2)
                            .foregroundColor(Color.gray.opacity(0.5))
                        
                        // Logout Text
                        Text("Logout")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        // Divider Line
                        Divider()
                            .frame(height: 2)
                            .background(Color.gray.opacity(0.5))
                            .padding(.horizontal, 16)
                        
                        // Confirmation Message
                        Text("Are you sure you want to log out?")
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                        
                        // Buttons (Cancel & Confirm)
                        HStack(spacing: 10) {
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Cancel")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                viewModel.logout(userid: "675")

                                dismiss()
                            }) {
                                Text("Confirm")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 20)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }
                .frame(height: 280)
            }
            .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)) // Dimmed background
        }
    }


    struct DeleteView: View {
        @Environment(\.dismiss) var dismiss // To close the sheet
        @StateObject private var viewModel = HomeviewModel()

        var body: some View {
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(radius: 5)
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea(edges: .bottom)
                    
                    VStack(spacing: 16) {
                        // Top Divider (Small line)
                        Rectangle()
                            .frame(width: 30, height: 2)
                            .foregroundColor(Color.gray.opacity(0.5))
                        
                        // Logout Text
                        Text("Delete")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        // Divider Line
                        Divider()
                            .frame(height: 2)
                            .background(Color.gray.opacity(0.5))
                            .padding(.horizontal, 16)
                        
                        // Confirmation Message
                        Text("Are you sure you want Delete the Account")
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                        
                        // Buttons (Cancel & Confirm)
                        HStack(spacing: 10) {
                            Button(action: {
                                
                                dismiss()
                                
                            }) {
                                Text("Cancel")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
//                                viewModel.deleteaccount(userid:"675")

                                dismiss()                        }) {
                                    Text("Confirm")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                }
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer().frame(height: 20)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                }
                .frame(height: 280)
            }
            .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)) // Dimmed background
        }
    }

    
    struct Accountsettinng_View: PreviewProvider {
        static var previews: some View {
            AccountsettinngView()
        }
    }
}




