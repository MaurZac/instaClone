//
//  UploadVController.swift
//  instaClone
//
//  Created by MaurZac on 25/06/20.
//  Copyright © 2020 MaurZac. All rights reserved.
//

import UIKit
import Firebase

class UploadVController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var upBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imgView.addGestureRecognizer(gestureRecognizer)
       
        // Do any additional setup after loading the view.
    }
    @objc func chooseImage(){
        let pickerControl = UIImagePickerController()
        pickerControl.delegate = self
        pickerControl.sourceType = .photoLibrary
        present(pickerControl, animated: true, completion: nil)
        
               
           }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeAlert(errorInput: String, messageInput: String){
        let alert  = UIAlertController(title: errorInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    

    
   
    
    
    
    @IBAction func uploadBtn(_ sender: UIButton) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data  = imgView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                if error != nil{
                    self.makeAlert(errorInput: "Error!", messageInput: error?.localizedDescription ?? "Error upload Firebase")
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            //DATABASE
                            let fireStoreDatabase = Firestore.firestore()
                            var fireStoreReference : DocumentReference? = nil
                            let fireStorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email, "postComment" : self.commentText.text!, "date": FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                            
                            fireStoreReference = fireStoreDatabase.collection("Posts").addDocument(data: fireStorePost, completion: { (error) in
                                if error != nil{
                                    self.makeAlert(errorInput: "Error!", messageInput: error?.localizedDescription ?? "eRROR!!")
                                }else{
                                    self.imgView.image = UIImage(named: "select.png")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                        }
                    }
                }
            }
        }
    }
    

}


