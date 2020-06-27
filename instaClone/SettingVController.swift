//
//  SettingVController.swift
//  instaClone
//
//  Created by MaurZac on 25/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit
import Firebase

class SettingVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      
    @IBAction func toVC(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toVController", sender: nil)
        }catch{
           print("error")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
