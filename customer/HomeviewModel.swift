import Foundation

class HomeviewModel: ObservableObject {
    @Published var categoriew: [CategoriesResponseModelItem] = []
    @Published var restauratcategory: [RestaurantCategoriesResponseModelItemm] = []
    @Published var restauratfood: [RestaurantFoodItem] = []
    @Published var fooddetailrespose: [FoodDetailResponseModel] = []
    @Published var resfooddetailrespose: [FoodDetailResponseModel] = []
    @Published var cartresponse: [CartResponseModel] = []
    @Published var addressresponse: [GetAddressResponseModelItem] = []
    @Published var shopresponse: FoodItem?
    @Published var addcartrespose:Addcartmodel?
    @Published var Activeorder: [ActiveOrderResponsemodel] = []
    @Published var deletecart:DeleteCartModel?
    @Published var food: [FoodModel] = []
    @Published var offermodel: [OfferModellItem] = []
    @Published var restaurantmodel: [RestaurantResponsModelItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    var selectedChip: CategoriesResponseModelItem?
    @Published var isOrderSuccess: Bool = false
    @Published var profileResponse: GetProfileResponseModel?
    @Published var upadteprofilee: Updateemployee?
    @Published  var doorNo = ""
    @Published  var street = ""
    @Published  var place = ""
    @Published var addressResponse: CreateAddressResponseModel?

    @Published  var cityy = ""
    @Published  var pincode = ""
    @Published  var landmark = ""
    @Published var fcm: String = "fltRlDfgTTSxCEjL7AXIo2:APA91bGAGaKVL3YkNQLNO_3XuHNsam8ZlkaGfINzEMhf1JCgon1ZWCLaX4UHNzIU3CfABLyqpMlI_EXoF0J-lUtJzNJxAo0K55hAmfuMX8-2QB8KUJotpP4"
    var checkout: CheckoutResponseModel?
    var updateprofilee: RegisterResponseModel?
    @Published var firstname: String =   (UserDefaults.standard.string(forKey: "userFirstName") ?? "")
    @Published var lastname: String = (UserDefaults.standard.string(forKey: "userLastName") ?? "")
    @Published var email: String = (UserDefaults.standard.string(forKey: "userEmail") ?? "")
    @Published var mobileno: String = (UserDefaults.standard.string(forKey: "mobileNo") ?? "")
    @Published var gender: String = "male"
    @Published var city: String = ""
    @Published var loginSuccess: Bool = false
    @Published var address: String = ""
    @Published var date: String = ""
    @Published var password: String = ""
    @Published var regiaterpassword: String = ""
    private let apiService = APIService()
    func getoffer() {
        isLoading = true
        errorMessage = nil

        apiService.getoffer { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let offer):
                    self?.offermodel = offer
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

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
    func getcartitem(customerId: Int) {
        isLoading = true
        errorMessage = nil

        apiService.getcart(customerId: customerId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.cartresponse = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func getaddress(customerId: Int) {
        isLoading = true
        errorMessage = nil

        apiService.getaddress(customerId: customerId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    print("✅ Address List Count: \(response.count)")
                    self?.addressresponse = response
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
    func getrestauerantcategory() {
        isLoading = true
        errorMessage = nil
        
        apiService.getrestaurantcategorylist { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let items):
                    self?.restauratcategory = items
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
                case .success(let branch):
                    self?.restaurantmodel = branch
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
                      self?.fooddetailrespose = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func getrestCategoryid(categoryId: String) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil

          apiService.getrestCategoryid(categoryId: categoryId) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.restauratfood = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func getProfile(customerId: Int) {
        isLoading = true
        errorMessage = nil

        apiService.getProfile(customerId: customerId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let profile):
                    self?.profileResponse = profile
                    UserDefaults.standard.set(profile.firstName, forKey: "userFirstName")
                                       UserDefaults.standard.set(profile.lastName, forKey: "userLastName")
                                       UserDefaults.standard.set(profile.email, forKey: "userEmail")
                                       UserDefaults.standard.set(profile.mobileNumber, forKey: "mobileNo")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func addcart(customerId: Int,foodid:Int,quatity:Int) { // Accept categoryId as a parameter
          isLoading = true
          errorMessage = nil
    
        apiService.addToCart(customerId: customerId, foodId: foodid, quantity:quatity) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.addcartrespose = food
                  case .failure(let error):
                      self?.errorMessage = error.localizedDescription
                  }
              }
          }
      }
    func deletecart(customerId: Int, foodid: Int, completion: @escaping (Bool) -> Void) {
        isLoading = true
        errorMessage = nil

        apiService.deletecart(customerId: customerId, foodId: foodid) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.deletecart = response
                    completion(true)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                }
            }
        }
    }

    func getshopid(shopid: Int) {
           isLoading = true
           errorMessage = nil

           apiService.getfoodid(foodid: shopid) { [weak self] result in
               DispatchQueue.main.async {
                   self?.isLoading = false
                   switch result {
                   case .success(let shop):
                       self?.shopresponse = shop
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
    func checkout(customerId: Int, checkoutId: Int, body: [String: String]) {
        isLoading = true
        errorMessage = nil

        apiService.checkoutapi(customerId: customerId, id: checkoutId, params: body) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.checkout = food
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
    func productchannge(resid:Int,type: String) {
          isLoading = true
          errorMessage = nil

        apiService.changecategory(resid:resid,type: type) { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let food):
                      self?.restauratfood = food
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

        let customerId = UserDefaults.standard.integer(forKey: "customerID")
        let type = "Order Placed"

        apiService.activeorders(customerId: customerId, type: type) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.Activeorder = food
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func cancelorders() {
        isLoading = true
        errorMessage = nil

        let customerId = UserDefaults.standard.integer(forKey: "customerID")
        let type = "Order Cancel"

        apiService.activeorders(customerId: customerId, type: type) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let food):
                    self?.Activeorder = food
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
    func getofferr() {
        isLoading = true
        errorMessage = nil

        apiService.getoffer { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let offer):
                    self?.offermodel = offer
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
    func updateprofile(completion: @escaping (Result<Updateemployee, Error>) -> Void) {
        self.isLoading = true
        self.errorMessage = nil

        apiService.updateprofile(
            customerId: UserDefaults.standard.integer(forKey: "customerID"),
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
                    self?.upadteprofilee = user // Optional: store locally
                    completion(.success(user)) // ✅ return success
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error)) // ✅ return failure
                }
            }
        }
    }
    func createAddress(completion: @escaping (Result<CreateAddressResponseModel, Error>) -> Void) {
        self.isLoading = true
        self.errorMessage = nil

        // Prepare the model to send
        let addressRequest = RequestAddressModel(
            landMark: landmark,
            doorNo: doorNo,
            street: street,
            place: place,
            city: cityy,
            pincode: pincode,
            customerbo: CustomerBO(customerId: UserDefaults.standard.integer(forKey: "customerID"))
        )

        // Call API from service layer
        apiService.createAddress(addressRequest) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.addressResponse = response  // optional: store the response
                    completion(.success(response))
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error))
                }
            }
        }
    }


   	
}
