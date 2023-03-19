//
//  HomeVM.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 19/03/2023.
//

import Foundation


class HomeVM:ObservableObject
{
    @Published var showIndicator = false
    @Published var showErrorMessage = false
    @Published var showSearch = false
    @Published var postsList:PostsResponseModel?
    var request = PostRequestModel(search: "", limit: 25, pageNo: 0)
    
    
}

extension HomeVM
{
    func getPosts() {
        showIndicator = true
        NetworkingManager.fetchdata(.posts(request)) {  [weak self ]
            (_ result: Result<PostsResponseModel?,NetworkingError>) in
            guard let self = self else {return}
            DispatchQueue.main.async { [self] in
                switch result
                {
                case .success(let data):
                    self.savePosts(data)
                case .failure(let error):
                    self.showError(error.description())
                }
                self.showIndicator = false
            }
        }
        
    }
    
    func savePosts(_ data:PostsResponseModel?) {
        if postsList != nil,
           data?.posts != nil
        {
            postsList!.posts! += data!.posts!
        }
        else
        {
            self.postsList = data
        }
    }
    
    func search() {
        request.pageNo = 0
        postsList = nil
        getPosts()
    }
    
    func clearSearch() {
        showSearch = false
        if request.search != ""
        {
            request.search = ""
            search()
        }
    }
    
    func nextPage(_ post:PostModel) {
        let count = (request.pageNo + 1) * request.limit
        let lastIndex = count - 1
        
        if post.id == postsList?.posts?[lastIndex].id,
           count < postsList?.total ?? 0
        {
            request.pageNo += 1
            getPosts()
        }
    }
    
    func showError(_ error:String) {
        GlobalVar.errorMSG = error
        showErrorMessage = true
    }
    
    
}
