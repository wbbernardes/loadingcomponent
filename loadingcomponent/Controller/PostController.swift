//
//  PostController.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import Foundation
import Alamofire

class PostController {

    // MARK: Request API

    func getPostsController(onCompletion: @escaping (Bool, String?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        AF.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let _ = try JSONDecoder().decode([PostList].self, from: data)
                    onCompletion(true, nil)
                } catch let error {
                    debugPrint("\(error)")
                    onCompletion(false, "\(error)")
                }
            } else {
                debugPrint("response error")
                onCompletion(false, nil)
            }
        }
    }
}
