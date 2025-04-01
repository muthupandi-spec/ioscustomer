import Foundation

class APIService {
    func fetchUsers(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
