import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService = APIService()

 
}
