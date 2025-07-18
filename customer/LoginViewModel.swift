import Foundation

class LoginViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var email: String = ""
    @Published var otp: String = ""
    @Published var firstname: String = ""
    @Published var register:RegisterResponseModel?
    @Published var loginn:LoginResponseModel?
    @Published var otpres:OtpResponseModel?

    @Published var lastname: String = ""
    @Published var mobileno: String = ""
    @Published var fcm: String = "c1axLYIcR06FMV0xCwjaYb:APA91bHG79Ob2OWw6s9GAoJa3oca4TuJSjCfPtDdnvzsxPyMK0pgJtSXO4vspq0xdegU_KcC-ZBMQuI9r3lUj_QzG8PzPD0dfSjPyaKYDHvfhvFAjRFUczY"
    @Published var gender: String = "male"
    @Published var city: String = ""
    @Published var address: String = ""
    @Published var date: String = ""
    @Published var password: String = ""
    @Published var regiaterpassword: String = ""
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
    func login(completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
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
                    // Here we assume the API has no wrapper like "status/message", just direct LoginResponseModel
                    self?.loginn = response
                    completion(.success(response)) // ✅ return full model

                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error)) // ✅ return error
                }
            }
        }
    }


    func register(completion: @escaping (Result<RegisterResponseModel, Error>) -> Void) {
        self.isLoading = true
        self.errorMessage = nil

        apiService.register(
            firstName: firstname,
            lastName: lastname,
            password: password,
            confirmpassword: password,
            email: email,
            mobileNumber: mobileno,
            fcmToken: fcm
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.register = user // Optional: store locally
                    completion(.success(user)) // ✅ return success
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error)) // ✅ return failure
                }
            }
        }
    }
    
    func verifyotp(completion: @escaping (Result<OtpResponseModel, Error>) -> Void ){
        guard !otp.isEmpty else {
            self.errorMessage = "Please enter OTP"
            return
        }

        self.isLoading = true
        self.errorMessage = nil

        apiService.verifyOtp(mobileNumber: mobileno, otp: otp) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.otpres = user // Optional: store locally
                    completion(.success(user)) // ✅ return success
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error)) // ✅ return failure
                }
            }
        }
    }

}
