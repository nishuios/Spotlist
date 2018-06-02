//
//  ViewController2.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
//import SRWebClient
class ViewController2: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
    
    
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        print("upload")
        loginfunction()
      
          }
    
    @IBAction func selectPhotoButtonTapped(sender: AnyObject) {
        
        print("select")
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
         myPickerController.allowsEditing = true
        myPickerController.sourceType = .photoLibrary
       
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImageView.contentMode = .scaleAspectFill
        self.dismiss(animated: true, completion: nil)
        
    }
    func loginfunction(){
        print("Start.....")
 
        let image = UIImage(named: "1.jpg")
        let imageData = UIImageJPEGRepresentation(image!, 0.90)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData!, withName: "rimg", fileName: "1.jpg", mimeType: "image/jpeg")
        }, to:"http://kolhapurtourism.co.in/ClassifiedApp/registration.php")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                     print(response.result)
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data?.base64EncodedString())     // server data
                     // result of response serialization
                    //                        self.showSuccesAlert()
                    //self.removeImage("frame", fileExtension: "txt")
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
            
        }
        
        
        
        
    
  }
}






