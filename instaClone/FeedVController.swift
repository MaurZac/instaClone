//
//  FeedVController.swift
//  instaClone
//
//  Created by MaurZac on 25/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableVi: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var imgArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVi.delegate = self
        tableVi.dataSource =  self
        
        // Do any additional setup after loading the view.
        getDataFromFireStore()
    }
    func getDataFromFireStore(){
        let fireStoreDb = Firestore.firestore()
      /*  let settings = fireStoreDb.settings
        settings.areTimestampsInSnapshotsEnabled = true
        fireStoreDb.settings = settings*/
        fireStoreDb.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                if snapshot?.isEmpty != true && snapshot != nil{
                    self.imgArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    
                    for  document in snapshot!.documents {
                        let documentID = document.documentID
                        if let postedBy = document.get("postedBy") as? String {
                            print(postedBy)
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                           
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as?  String {
                            print(imageUrl)
                            self.imgArray.append(imageUrl)
                        }
                    }
                    
                    self.tableVi.reloadData()
                }
                
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableVi.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
       
        cell.usrEmailLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.usrImgView.sd_setImage(with: URL(string: self.imgArray[indexPath.row]))
        return cell
       }

}
