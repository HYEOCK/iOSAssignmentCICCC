//
//  MainViewController.swift
//  Login
//
//  Created by doris on 22/08/2019.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var username: String = ""
    var password: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = username
        self.navigationItem.title = password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    
    }

}
