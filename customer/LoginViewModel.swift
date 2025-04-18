import Foundation

class LoginViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var email: String = ""
    @Published var otp: String = ""
    @Published var password: String = "hgfhfh"
    @Published var loginSuccess: Bool = false
    private let apiService = APIService()

    func getUsers() {
        isLoading = true
        errorMessage = nil

        apiService.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let users):
                    self?.users = users
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func login() {
            guard !email.isEmpty, !password.isEmpty else {
                self.errorMessage = "Please enter both email and password"
                return
            }
            
            self.isLoading = true
            self.errorMessage = nil
            
        apiService.loginUser(email: email, password: password) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let response):
                        if response.status {
                            self?.loginSuccess = true
                            print("✅ Login Success: \(response.message)")
                            // You can store user data here if needed
                        } else {
                            self?.errorMessage = response.message
                        }
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    func verifyotp() {
            guard !otp.isEmpty else {
                self.errorMessage = "Please enter otp"
                return
            }
            
            self.isLoading = true
            self.errorMessage = nil
            
        apiService.verifyotp(otp:otp ) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let response):
                        if response.status {
                            self?.loginSuccess = true
                            // You can store user data here if needed
                        } else {
                            self?.errorMessage = response.message
                        }
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }

}
