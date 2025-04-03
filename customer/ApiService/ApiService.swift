import Foundation

class APIService {
    func fetchUsers(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users" // Replace with your actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        print("🔗 Request URL: \(url.absoluteString)")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Response Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("⚠️ No data received")
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            print("📩 Response Data: \(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 Data")")

            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
