//
//  SecondViewController.swift
//  loadingcomponent
//
//  Created by Wesley AIS on 27/06/20.
//  Copyright © 2020 wb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Configuration ids
    
    static let storyboard = "Main"
    static let viewControllerId = "SecondViewController"

    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - Properties

    var isFromPresenter: Bool = false
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = isFromPresenter ? "Requisição pela Presenter" : "Requisição pela Controller"
    }
}
