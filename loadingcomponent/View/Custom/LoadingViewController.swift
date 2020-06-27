//
//  LoadingViewController.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {

    // MARK: - Configuration ids
    
    static let storyboard = "Custom"
    static let viewControllerId = "LoadingViewController"

    // MARK: - Outlets

    @IBOutlet weak var viewAnimation: UIView! {
        didSet {
            viewAnimation.layer.cornerRadius = 18.0
            viewAnimation.layer.shadowColor = UIColor.black.cgColor
            viewAnimation.layer.shadowOpacity = 0.5
            viewAnimation.layer.shadowOffset = .zero
            viewAnimation.layer.shadowRadius = 10
        }
    }

    // MARK: - Properties

    let animationView = AnimationView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }

    func startAnimation() {
        animationView.frame = viewAnimation.bounds
        animationView.animation = Animation.named("8370-loading")
        animationView.contentMode = .scaleAspectFit
        viewAnimation.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
    }

}
