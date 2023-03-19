//
//  ContentView.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loginVM = LoginVM()
    
    var body: some View {
        NavigationView {
            
            VStack
            {
                NavigationLink(destination: LoginView(), tag: "Login", selection: $loginVM.loginStatus) {
                    EmptyView()
                }
                NavigationLink(destination: HomeView(), tag: "Home", selection: $loginVM.loginStatus) {
                    EmptyView()
                }
            }
        }
        .onAppear(){
            if let username = GlobalVar.qurbaUserDefaults.value(forKey: "username") as? String ,
               let password = GlobalVar.qurbaUserDefaults.value(forKey: "password") as? String
            {
                loginVM.loginUser = LoginRequestModel(username: username, password: password)
                loginVM.login()
            }
            else
            {
                loginVM.loginStatus = "Login"
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
