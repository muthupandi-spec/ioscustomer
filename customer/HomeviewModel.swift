import Foundation

class HomeviewModel: ObservableObject {
    @Published var categoriew: [CategoriesResponseModelItem] = []
    @Published var food: [FoodModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    var selectedChip: CategoriesResponseModelItem?
    @Published var firstname: String = ""
    @Published var lastname: String = ""
    @Published var email: String = ""
    @Published var mobileno: String = ""
    @Published var gender: String = "male"
    @Published var city: String = ""
    @Published var loginSuccess: Bool = false
    @Published var address: String = ""
    @Published var date: String = ""
    @Published var password: String = "hgfhfh"
    @Published var regiaterpassword: String = ""
    private let apiService = APIService()

    func getfood() {
        isLoading = true
        errorMessage = nil

        apiService.foodlist { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getcategory() {
        isLoading = true
        errorMessage = nil
        
        apiService.getcategorylist { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let items):
                    self?.categoriew = items
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("🛑 API Error: \(error.localizedDescription)")
                }
            }
        }
    }
    func getbrach() {
        isLoading = true
        errorMessage = nil

        apiService.getbranch { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getforyou() {
        isLoading = true
        errorMessage = nil

        apiService.foryou { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func getbannner() {
        isLoading = true
        errorMessage = nil

        apiService.getbanner { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func getshopfooditem() {
        isLoading = true
        errorMessage = nil

        apiService.shopfoodlist { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getCategoryid(categoryId: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.getCategoryid(categoryId: categoryId) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func logout(userid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.logout(userid: userid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func deleteaccount(userid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.deleteaccount(userid: userid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func viewcart(orderid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.viewcart(orderid: orderid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }

    func applycoupon(coupon: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.applycoupon(coupon: coupon) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func cancelorder(orderid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.cancelorder(orderid: orderid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func topupwallet(topup: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.topupwallet(topup: topup) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func checkout(orderid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.checkoutapi(orderid: orderid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }

    
    func getorderdetail(orderid: String) {
          isLoading = true
          errorMessage = nil

          apiService.getorderdetail(orderId: orderid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func productchannge(type: String) {
          isLoading = true
          errorMessage = nil

          apiService.changecategory(type: type) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }

    func getfooddetail(foodid: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.getfooddetail(foodid: foodid) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.food = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func getcartitem() {
        isLoading = true
        errorMessage = nil

        apiService.getcart { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func transactionhistory() {
        isLoading = true
        errorMessage = nil

        apiService.transactionhistory { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func activeorder() {
        isLoading = true
        errorMessage = nil

        apiService.activeorders { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func cancelorders() {
        isLoading = true
        errorMessage = nil

        apiService.cancelorders { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func completedorders() {
        isLoading = true
        errorMessage = nil

        apiService.completedorders { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func getrestaurantfood() {
        isLoading = true
        errorMessage = nil

        apiService.getrestaurentfooditem { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getnotification() {
        isLoading = true
        errorMessage = nil

        apiService.getnotification { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getoffer() {
        isLoading = true
        errorMessage = nil

        apiService.getoffer { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getfavourite() {
        isLoading = true
        errorMessage = nil

        apiService.getfavourite { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.food = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func updateprofile() {
           
            
            self.isLoading = true
            self.errorMessage = nil
      
        apiService.updateprofile(firstname: firstname, lastname: lastname, city: city, address: address, date: date, email: email, password: regiaterpassword,mobileno: mobileno,gender: gender) { [weak self] result in
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


   	
}
