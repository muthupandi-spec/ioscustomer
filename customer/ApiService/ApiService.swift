import Foundation

class APIService {
    let baseurl="https://64cde41311ca.ngrok-free.app/"
    func getProfile(customerId: Int, completion: @escaping (Result<GetProfileResponseModel, Error>) -> Void) {
        let urlString =  baseurl + "restaurant/api/customer/v1/getemployee/\(customerId)" // Replace with actual base URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        print("🔗 Request URL: \(url.absoluteString)")

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
                completion(.failure(NSError(domain: "No Data", code: 0)))
                return
            }

            print("📩 Response Data: \(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 Data")")

            do {
                let responseModel = try JSONDecoder().decode(GetProfileResponseModel.self, from: data)
                completion(.success(responseModel))
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
    func getalloffer(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"restaurant/api/home/getalloffer" // Replace with your actual API URL
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
    func transactionhistory(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"transactionhistory" // Replace with your actual API URL
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

    func activeorders(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"activeorders" // Replace with your actual API URL
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
    func cancelorders(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"cancelorders" // Replace with your actual API URL
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
    func completedorders(completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl+"completedorders" // Replace with your actual API URL
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
    func addToCart(customerId: Int, foodId: Int, quantity: Int, completion: @escaping (Result<Addcartmodel, Error>) -> Void) {
        let urlString = "\(baseurl)restaurant/api/cart/add/\(customerId)/\(foodId)/\(quantity)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        print("🔗 Request URL: \(url.absoluteString)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("⚠️ No data received")
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            print("📩 Response: \(String(data: data, encoding: .utf8) ?? "Invalid response")")

            do {
                let decodedData = try JSONDecoder().decode(Addcartmodel.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("💥 JSON Decode Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func deletecart(customerId: Int, foodId: Int, completion: @escaping (Result<DeleteCartModel, Error>) -> Void) {
        let urlString = "\(baseurl)restaurant/api/cart/deletecart/\(customerId)/\(foodId)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        print("🔗 Request URL: \(url.absoluteString)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("⚠️ No data received")
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            print("📩 Response: \(String(data: data, encoding: .utf8) ?? "Invalid response")")

            do {
                let decodedData = try JSONDecoder().decode(DeleteCartModel.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("💥 JSON Decode Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func getcart(customerId: Int,completion: @escaping (Result<[CartResponseModel], Error>) -> Void) {
        let urlString = baseurl+"restaurant/api/cart/viewcart/\(customerId)" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([CartResponseModel].self, from: data)
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

    func getbranch(completion: @escaping (Result<[RestaurantResponsModelItem], Error>) -> Void) {
        let urlString = baseurl+"restaurant/api/restaurant/getallrestaurant" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([RestaurantResponsModelItem].self, from: data)
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

    func changecategory(resid:Int,type: String, completion: @escaping (Result<[RestaurantFoodItem], Error>) -> Void) {
        let urlString = "\(baseurl)restaurant/api/food/getfoodbyrestaurantid/\(resid)/\(type)"
        
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
                let users = try JSONDecoder().decode([RestaurantFoodItem].self, from: data)
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
        let urlString = baseurl+"restaurant/api/catagory/getallcatagory" // Replace with your actual API URL
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
    func getrestaurantcategorylist(completion: @escaping (Result<[RestaurantCategoriesResponseModelItemm], Error>) -> Void) {
        let urlString = baseurl+"restaurant/api/restaurantcatagory/getallcatagory" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([RestaurantCategoriesResponseModelItemm].self, from: data)
                completion(.success(users))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    

    func getCategoryid(categoryId: String, completion: @escaping (Result<[FoodDetailResponseModel], Error>) -> Void) {
        let urlString = baseurl + "restaurant/api/food/getcatagoryfoodid/\(categoryId)" // GET format with path parameter
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("🔗 Request URL: \(url.absoluteString)")

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
                let categories = try JSONDecoder().decode([FoodDetailResponseModel].self, from: data)
                completion(.success(categories))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func getrestCategoryid(categoryId: String, completion: @escaping (Result<[RestaurantFoodItem], Error>) -> Void) {
        let urlString = baseurl + "restaurant/api/food/getfoodbyrestaurantcatagoryid/\(categoryId)" // GET format with path parameter
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("🔗 Request URL: \(url.absoluteString)")

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
                let categories = try JSONDecoder().decode([RestaurantFoodItem].self, from: data)
                completion(.success(categories))
            } catch {
                print("💥 JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func getfoodid(foodid: Int, completion: @escaping (Result<FoodItem, Error>) -> Void) {
           let urlString = baseurl + "restaurant/api/food/getfoodid/\(foodid)"
           guard let url = URL(string: urlString) else {
               completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
               return
           }

           var request = URLRequest(url: url)
           request.httpMethod = "GET"

           print("🔗 Request URL: \(url.absoluteString)")

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
                   let decodedItem = try JSONDecoder().decode(FoodItem.self, from: data)
                   completion(.success(decodedItem))
               } catch let DecodingError.keyNotFound(key, context) {
                   print("Key '\(key)' not found: \(context.debugDescription)")
                   completion(.failure(DecodingError.keyNotFound(key, context)))
               } catch let DecodingError.typeMismatch(type, context) {
                   print("Type '\(type)' mismatch: \(context.debugDescription)")
                   completion(.failure(DecodingError.typeMismatch(type, context)))
               } catch let DecodingError.valueNotFound(value, context) {
                   print("Value '\(value)' not found: \(context.debugDescription)")
                   completion(.failure(DecodingError.valueNotFound(value, context)))
               } catch {
                   print("Other decoding error: \(error)")
                   completion(.failure(error))
               }
           }

           task.resume()
       }
   
    func applycoupon(coupon: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/applycoupon" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "coupon=\(coupon)"
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
    func logout(userid: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/logout" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "userid=\(userid)"
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
    func deleteaccount(userid: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/deleteaccount" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "userid=\(userid)"
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
    func topupwallet(topup: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/topupwallet" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "topup=\(topup)"
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

    func cancelorder(orderid: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/cancelorder" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "orderid=\(orderid)"
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
    func checkoutapi(customerId: Int, id: Int, params: [String: String], completion: @escaping (Result<CheckoutResponseModel, Error>) -> Void) {
        let urlString = "\(baseurl)restaurant/api/orders/confirmorder/\(customerId)/\(id)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // ✅ JSON

        // ✅ Fix: send raw JSON
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
            request.httpBody = jsonData
        } catch {
            print("❌ JSON Encoding Failed")
            completion(.failure(error))
            return
        }

        print("🔗 Request URL: \(url.absoluteString)")
        print("📨 Request Body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "N/A")")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0)))
                return
            }

            do {
                let responseModel = try JSONDecoder().decode(CheckoutResponseModel.self, from: data)
                completion(.success(responseModel))
            } catch {
                print("💥 JSON Decode Error: \(error)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func viewcart(orderid: String, completion: @escaping (Result<[FoodModel], Error>) -> Void) {
        let urlString = baseurl + "/viewcart" // Replace with actual API URL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        // ✅ URL-Encoded Parameters
        let postString = "orderid=\(orderid)"
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
    func getoffer(completion: @escaping (Result<[OfferModellItem], Error>) -> Void) {
        let urlString = baseurl+"restaurant/api/home/getalloffer" // Replace with your actual API URL
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
                let users = try JSONDecoder().decode([OfferModellItem].self, from: data)
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
    
    func loginUser(email: String, password: String, completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        let urlString = baseurl + "restaurant/api/auth/login"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "userName": email,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let responseData = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func verifyOtp(
        mobileNumber: String,
        otp: String,
        completion: @escaping (Result<OtpResponseModel, Error>) -> Void
    ) {
        // 🔗 Construct URL with query parameters
        let urlString = "\(baseurl)restaurant/api/auth/verify-otp?mobileNumber=\(mobileNumber)&otp=\(otp)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        print("📤 Verifying OTP")
        print("📡 URL: \(url.absoluteString)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📬 Response Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("⚠️ No response data")
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            print("📦 Response Body: \(String(data: data, encoding: .utf8) ?? "Invalid UTF-8")")

            do {
                let decoded = try JSONDecoder().decode(OtpResponseModel.self, from: data)
                completion(.success(decoded))
            } catch {
                print("💥 JSON decode failed: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
    func register(
        firstName: String,
        lastName: String,
        password: String,
        confirmpassword: String,
        email: String,
        mobileNumber: String,
        fcmToken: String,
        completion: @escaping (Result<RegisterResponseModel, Error>) -> Void
    ) {
        let urlString = baseurl + "restaurant/api/auth/send-otp"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // ✅ Convert parameters to JSON
        let parameters: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "confirmpassword": confirmpassword,
            "email": email,
            "mobileNumber": mobileNumber,
            "fcmToken": fcmToken
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = jsonData

            // 🔍 Print URL and JSON body
            print("📡 Request URL: \(url.absoluteString)")
            print("📤 Request Body:\n\(String(data: jsonData, encoding: .utf8) ?? "Invalid JSON")")

        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📬 Response Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("⚠️ No data received")
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            // 📝 Print full raw response data
            if let rawString = String(data: data, encoding: .utf8) {
                print("📩 Response JSON:\n\(rawString)")
            }

            do {
                let responseData = try JSONDecoder().decode(RegisterResponseModel.self, from: data)
                completion(.success(responseData))
            } catch {
                print("💥 Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func updateprofile(
        customerId: Int,
        firstName: String,
        lastName: String,
        password: String,
        confirmpassword: String,
        email: String,
        mobileNumber: String,
        fcmToken: String,
        completion: @escaping (Result<Updateemployee, Error>) -> Void
    ) {
        let urlString = baseurl + "restaurant/api/customer/v1/update"
        print("Request URL: \(urlString)")

        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        let parameters: [String: Any] = [
            "customerId": customerId,
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "confirmpassword": confirmpassword,
            "email": email,
            "mobileNumber": mobileNumber,
            "fcmToken": fcmToken
        ]
        
        print("Request Parameters: \(parameters)")

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            // ✅ Print response status code
            if let httpResponse = response as? HTTPURLResponse {
                print("Response Status Code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            // Optional: print response body as string (for debugging)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response Body: \(jsonString)")
            }

            do {
                let decoded = try JSONDecoder().decode(Updateemployee.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }




  



}
