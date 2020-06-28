//
//  FeedVController.swift
//  instaClone
//
//  Created by MaurZac on 25/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit

class FeedVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableVi: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVi.delegate = self
        tableVi.dataSource =  self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableVi.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.usrEmailLabel.text = "test@email.com"
        cell.likeLabel.text = "0"
        cell.commentLabel.text = "comment ok"
        cell.usrImgView.image = UIImage(named: "select.png")
        return cell
       }

}
