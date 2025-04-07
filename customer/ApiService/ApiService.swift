import Foundation

class APIService {
    let baseurl="https://jsonplaceholder.typicode.com"
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
    func foodlist(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"foodlist" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getbranch(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getbrach" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getcategorylist(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getcategory" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getCategoryid(categoryId: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/getcategoryid" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "categoryId=\(categoryId)"
        request.httpBody = postString.data(using: .utf8)

        print("🔗 Request URL: \(url.absoluteString)")
        print("📨 Request Body: \(postString)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
                let categories = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(categories))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getcart(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getcartitem" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getnotification(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getnontification" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getoffer(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getoffer" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getfavourite(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getfavourite" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }



}
