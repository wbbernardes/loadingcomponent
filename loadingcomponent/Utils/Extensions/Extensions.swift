//
//  Extensions.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func startLoading() {
        let storyboard = UIStoryboard(name: LoadingViewController.storyboard, bundle: nil)
        if let loadingViewController = storyboard.instantiateViewController(withIdentifier: LoadingViewController.viewControllerId) as? LoadingViewController {
            loadingViewController.modalPresentationStyle = .overCurrentContext
            present(loadingViewController, animated: true, completion: nil)
        }
    }
}
