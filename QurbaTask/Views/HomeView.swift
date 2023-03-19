//
//  HomeView.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 18/03/2023.
//

import SwiftUI
import SwiftUISnackbar


struct HomeView: View {
    @ObservedObject var homeVM = HomeVM()
    @State var isShowImage = false
    @State private var isProfile = false
    
    func openImage (_ isProfileImage: Bool) {
        isProfile = isProfileImage
        isShowImage = true
    }
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: ImageSliderView(isProfile: isProfile), isActive: $isShowImage) {
                EmptyView()
            }
            
            if homeVM.showSearch
            {
                ZStack(alignment: .trailing) {
                    CustomTextField(placeHolderText: "Search", text: $homeVM.request.search, isSecure: .constant(false))
                        .onSubmit {
                            homeVM.search()
                        }
                    
                    Button {
                        homeVM.clearSearch()
                    } label: {
                        Image("colseCircle")
                            .resizable()
                            .iconImageView()
                    }
                }
                .padding(12)
                
            }
            else
            {
                HStack {
                    Text("LOGO")
                        .font(AppTheme.fontSize())
                        .bold()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [AppTheme.gradientStartColor, AppTheme.gradientEndColor],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                    Button {
                        homeVM.showSearch.toggle()
                    } label: {
                        Image("search")
                            .resizable()
                            .iconImageView(color: AppTheme.mainAppColor)
                    }
                }
                .padding(12)
                
            }
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack
                {
                    ForEach(homeVM.postsList?.posts ?? [], id: \.self.id) { post in
                        VStack(alignment:.leading,spacing:8)
                        {
                            PostView(post: post, openImage: openImage)
                                .onAppear(){
                                    homeVM.nextPage(post)
                                }
                        }
                        
                    }
                }
                
                
            }
            .padding(16)
        }
        .navigationBarHidden(true)
        .onAppear(){
            homeVM.getPosts()
        }
        .snackbar(isShowing: $homeVM.showErrorMessage, title: "", text: GlobalVar.errorMSG, style: .custom(.accentColor), dismissOnTap: true, dismissAfter: 3.0)

    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
