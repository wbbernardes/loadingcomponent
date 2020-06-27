//
//  MainViewController.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties

    private let postPresenter = PostPresenter()
    private let postController = PostController()
    var isFromPresenter: Bool = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        postPresenter.delegate = self
    }

    // MARK: - Actions

    @IBAction func presenterAction(_ sender: UIButton) {
        isFromPresenter = true
        self.startLoading()
        postPresenter.getPostsPresenter()
    }

    @IBAction func controllerAction(_ sender: UIButton) {
        isFromPresenter = false
        self.startLoading()
        postController.getPostsController { (result, error) in
            self.dismiss(animated: false) {
                if result {
                    self.goToSecond(isFromPresenter: false)
                } else if let error = error {
                    debugPrint(error)
                } else {
                    debugPrint("General Controller Error !!!")
                }
            }
        }
    }

    // MARK: - Navigation

    func goToSecond(isFromPresenter: Bool) {
        let storyboard = UIStoryboard(name: SecondViewController.storyboard, bundle: nil)
        if let personalizeViewController = storyboard.instantiateViewController(withIdentifier: SecondViewController.viewControllerId) as? SecondViewController {
            personalizeViewController.isFromPresenter = isFromPresenter
            self.navigationController?.pushViewController(personalizeViewController, animated: true)
        }
    }
    
}

extension MainViewController: PostPresenterDelegate {
    func getPosts(_ success: Bool, _ error: String?) {
        self.dismiss(animated: false) {
            if success {
                self.goToSecond(isFromPresenter: self.isFromPresenter)
            } else if let error = error {
                debugPrint(error)
            } else {
                debugPrint("General Presenter Error !!!")
            }
        }
    }
}
