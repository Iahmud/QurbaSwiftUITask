//
//  LoginVM.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import Foundation


class LoginVM:ObservableObject
{
    @Published var showIndicator = false
    @Published var showErrorMessage = false
    @Published var loginStatus: String? = ""
    @Published var isSecure = true
    @Published var loginUser = LoginRequestModel(username: "", password: "")
}

extension LoginVM
{
    func login() {
        guard checkUserInput() else { return }
        showIndicator = true
        NetworkingManager.fetchdata(.login(loginUser)) {  [weak self ]
            (_ result: Result<LoginResponseModel?,NetworkingError>) in
            guard let self = self else {return}
            DispatchQueue.main.async { [self] in
                switch result
                {
                case .success(let data):
                    self.saveLogin(data)
                case .failure(let error):
                    self.showError(error.description())
                    self.loginStatus = "Login"
                }
                self.showIndicator = false
            }
        }
        
    }
    
    func saveLogin(_ data:LoginResponseModel?) {
        if data?.token != nil
        {
            GlobalVar.qurbaUserDefaults.set(self.loginUser.username, forKey: "username")
            GlobalVar.qurbaUserDefaults.set(self.loginUser.password, forKey: "password")
            GlobalVar.user = data!
            loginStatus = "Home"
        }
        else
        {
            showError("Incoreect Username or Passwod")
            loginStatus = "Login"
        }
    }
    
    func showError(_ error:String) {
        GlobalVar.errorMSG = error
        showErrorMessage = true
    }
    
    
    func checkUserInput() -> Bool{
        
        guard  ValidateUser.isemptyInput(loginUser.username),
               ValidateUser.isemptyInput(loginUser.password)
        else { showError("Please fill out the data first.")
            return false}
        
        return true
    }
    
}
