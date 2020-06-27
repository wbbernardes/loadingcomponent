//
//  PostPresenter.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import Foundation
import Alamofire

protocol PostPresenterDelegate: AnyObject {
    func getPosts(_ success: Bool, _ error: String?)
}

class PostPresenter {

    // MARK: - Properties

    weak var delegate: PostPresenterDelegate?

    // MARK: Request API

    func getPostsPresenter() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let _ = try JSONDecoder().decode([PostList].self, from: data)
                    self.delegate?.getPosts(true, nil)
                } catch let error {
                    debugPrint("\(error)")
                    self.delegate?.getPosts(false, "\(error)")
                }
            } else {
                debugPrint("response error")
                self.delegate?.getPosts(false, nil)
            }
        }
    }
}
