//
//  LoginView.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import SwiftUI
import SwiftUISnackbar


struct LoginView: View {
    @ObservedObject var loginVM = LoginVM()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .leading) {
                
                NavigationLink(destination: HomeView(), tag: "Home", selection: $loginVM.loginStatus) {
                    EmptyView()
                }
                
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                HStack {
                    Spacer()
                    Text("Welcome")
                        .bold()
                        .title3View()
                    Spacer()
                    
                }
                .padding(16)
                
                VStack (alignment: .leading){
                    Text("User Name")
                        .bold()
                        .subheadlineView()
                    CustomTextField(placeHolderText: "Enter your user name", text: $loginVM.loginUser.username, isSecure: .constant(false))
                    
                }
                .padding([.horizontal,.top], 16)
                
                VStack (alignment: .leading){
                    Text("Password")
                        .bold()
                        .subheadlineView()
                    
                    ZStack(alignment: .trailing) {
                        CustomTextField(placeHolderText: "Enter your password", text: $loginVM.loginUser.password, isSecure: $loginVM.isSecure)
                        
                        Button {
                            loginVM.isSecure.toggle()
                            
                        } label: {
                            Image("eye")
                                .resizable()
                                .iconImageView(color: loginVM.isSecure ? AppTheme.grayColor:.accentColor)
                            
                        }
                        
                    }
                    
                }
                .padding([.horizontal,.top], 16)
                
                
                Button {
                    loginVM.login()
                    
                } label: {
                    Text("Sign in")
                        .headlineView( color: AppTheme.viewsBackground)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                        .padding([.horizontal, .top], 16)
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .keyboardManagment()
        .navigationBarHidden(true)
        .snackbar(isShowing: $loginVM.showErrorMessage, title: "", text: GlobalVar.errorMSG, style: .custom(.accentColor), dismissOnTap: true, dismissAfter: 3.0)
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


/*
 "username":"atuny0",
 "password":"9uQFF1Lh",
 */
