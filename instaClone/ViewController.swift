//
//  ViewController.swift
//  instaClone
//
//  Created by MaurZac on 21/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit
import Firebase

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
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil{
                    self.errorAlert(errorInput: "Error!", messageInput: error?.localizedDescription ?? "Error at firebase register")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else{
           errorAlert(errorInput: "Error!", messageInput: "username/password")
        }
        
    }
    
    
    func errorAlert(errorInput: String, messageInput: String){
        let alert = UIAlertController(title: errorInput , message: messageInput, preferredStyle: UIAlertController.Style.alert)
                   let okBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                   alert.addAction(okBtn)
                   self.present(alert, animated: true, completion: nil)
    }
    
}

