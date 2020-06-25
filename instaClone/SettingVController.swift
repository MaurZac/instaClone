//
//  SettingVController.swift
//  instaClone
//
//  Created by MaurZac on 25/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit

class SettingVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      
    @IBAction func toVC(_ sender: UIButton) {
        performSegue(withIdentifier: "toVController", sender: nil)
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
