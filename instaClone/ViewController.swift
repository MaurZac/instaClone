//
//  ViewController.swift
//  instaClone
//
//  Created by MaurZac on 21/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    @IBAction func register(_ sender: UIButton) {
    }
    
}

