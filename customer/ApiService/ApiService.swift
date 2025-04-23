import Foundation

class APIService {
    let baseurl="http://65.0.85.4:8090/"
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
    func shopfoodlist(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"shopfooditem" // Replace with your actual API URL
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
    func getbanner(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getbanner" // Replace with your actual API URL
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
    func foryou(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/foryou" // Replace with your actual API URL
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

    func changecategory(type: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = "\(baseurl)/changeproduct?product=\(type)"
        
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

    func getorderdetail(orderId: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = "\(baseurl)/getorderdetail?orderid=\(orderId)"
        
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

    
    
    
    
    func getcategorylist(completion: @escaping (Result<[CategoriesResponseModelItem], Error>) -> Void) {
        let urlString = baseurl+"Hotel/api/catagory/getallcatagory" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([CategoriesResponseModelItem].self, from: data)
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
    func getfooddetail(foodid: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/getfoodtem" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "categoryId=\(foodid)"
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
    func getrestaurentfooditem(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"/getrestaurantfooditem" // Replace with your actual API URL
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
    
    func loginUser(email: String, password: String, completion: @escaping (Result<FoodModel, Error>) -> Void) {
        let urlString = baseurl + "/login" // Replace with your actual login endpoint
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-encoded POST body
        let postString = "email=\(email)&password=\(password)"
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
                let responseData = try JSONDecoder().decode(FoodModel.self, from: data)
                completion(.success(responseData))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func verifyotp(otp: String,completion: @escaping (Result<FoodModel, Error>) -> Void) {
        let urlString = baseurl + "/verifyotp" // Replace with your actual login endpoint
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-encoded POST body
        let postString = "otp=\(otp)"
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
                let responseData = try JSONDecoder().decode(FoodModel.self, from: data)
                completion(.success(responseData))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func register(firstname: String, lastname: String, city: String, address: String,date: String, email: String,password: String,mobileno: String,gender: String,completion: @escaping (Result<FoodModel, Error>) -> Void) {
        let urlString = baseurl + "/login" // Replace with your actual login endpoint
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-encoded POST body
        let postString = "firstname=\(firstname)&lastname=\(lastname)&date=\(date)&city=\(city)&address=\(address)&email=\(email)&password=\(password)&mobileno=\(mobileno)&gender=\(gender)"
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
                let responseData = try JSONDecoder().decode(FoodModel.self, from: data)
                completion(.success(responseData))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }




}
