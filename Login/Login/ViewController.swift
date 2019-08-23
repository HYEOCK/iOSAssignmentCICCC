//
//  ViewController.swift
//  Login
//
//  Created by doris on 22/08/2019.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if segue.identifier == "Login"{
            let destVC = segue.destination as! MainViewController
            destVC.username = usernameField.text!
            destVC.password = passwordField.text!
        }
    }
    
}

