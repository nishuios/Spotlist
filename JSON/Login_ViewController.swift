//
//  Login_ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 08/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Alamofire
class Login_ViewController: UIViewController,UITextFieldDelegate {

   
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var myimageview: UIImageView!
    @IBOutlet weak var myscrollview: UIScrollView!

    
    //login button and Validtaion......
    @IBAction func login(_ sender: Any) {
        
    
         if self.email.text == "" && self.password.text == "" {
            
        let alert1 = UIAlertController(title: "Login", message: "Both fields is empty..!", preferredStyle: UIAlertControllerStyle.alert)
            let ema = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert1.addAction(ema)
             present(alert1, animated: true, completion: nil)
            
        }else if self.password.text == "" {
             let alert2 = UIAlertController(title: "Login", message: "Password field is empty...!", preferredStyle: UIAlertControllerStyle.alert)
         let pass = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert2.addAction(pass)
             present(alert2, animated: true, completion: nil)
        }else {
             let alert3 = UIAlertController(title: "Login", message: "E-mail field is empty", preferredStyle: UIAlertControllerStyle.alert)
            if self.email.text == "" {
         
            let both = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alert3.addAction(both)
                 present(alert3, animated: true, completion: nil)
            } else if self.email.text != nil && self.password.text != nil{
                
                print("check")
                loginfunction()
                
            }
      }
  
    }
    
    
    
    // checking while login, if the user is there or not
    func insertintofcm_did(){
        
        let mac = UIDevice.current.identifierForVendor?.uuidString
        print(mac!)
        let uuid = NSUUID().uuidString.lowercased()
        
        let params:Parameters = [ "email":self.email.text!,
  //                                "token":"chbdhbcbdbcbdhcCDCdcdcjnjdncjdjcncd",
                                  "imei":mac!,
                                  "email_status":"1",
                                  "sound":"1"    ]
        
        
        Alamofire.request("http://kolhapurtourism.co.in/ClassifiedApp/login.php", method: .post, parameters: params, encoding: URLEncoding.httpBody).responseJSON { response in
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Response: \(json as Any)")
            }
        }
    }
   
    //Sign up button for registration
    @IBAction func signup(_ sender: Any) {
        
        
//        let image = UIImage(named: "1.jpg")
//        let data = UIImageJPEGRepresentation(image!, 1.0)
//        //print(data as? Any)
//       // let str = String(data: data!, encoding: String.Encoding.utf8)
//        let date = DateFormatter()
//        date.dateStyle = .medium
////        let pa:Parameters = ["fname":"ranjit",
////                            "lname":"khapare",
////                            "email":"ranjitkhapare45@yahoo.com",
////                            "pass":"456123",
////                            "mobile":"45454545",
////                            "rimg":str as Any,
////                            "rdate":date,
////                            "dob":"3-6-1994"]
//       
//        
//        let parameters = ["uid":"nishu353535@gmail.com", "pass":"123456"]
//        
//            // Image to upload:
//            let imageToUploadURL = Bundle.main.url(forResource: "1", withExtension: "jpg")
//                     // Server address (replace this with the address of your own server):
//             let url = "http://kolhapurtourism.co.in/ClassifiedApp/Registration.php"
//        
//             // Use Alamofire to upload the image
//             Alamofire.upload(
//                     multipartFormData: { multipartFormData in
//                             // On the PHP side you can retrive the image using $_FILES["image"]["tmp_name"]
//                             multipartFormData.append(imageToUploadURL!, withName: "rimg")
//                             for (key, val) in parameters {
//                                     multipartFormData.append(val.data(using: String.Encoding.utf8)!, withName: key)
//                                 }
//                     },
//                     to: url,
//                     encodingCompletion: { encodingResult in
//                         switch encodingResult {
//                         case .success(let upload, _, _):
//                             upload.responseJSON { response in
//                                 if let jsonResponse = response.result.value as? [String: Any] {
//                                     print(jsonResponse)
//                                 }
//                             }
//                        case .failure(let encodingError):
//                             print(encodingError)
//                         }
//                 }
//                 )
         }
          override func viewDidLoad() {
        super.viewDidLoad()

            
        self.myview.layer.cornerRadius = 8
        self.password.textColor = UIColor.white
        self.email.textColor = UIColor.white
        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
        self.email.delegate = self
        self.password.delegate = self
    
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
            
          
            gradientcolor()
        
    }
    
    func gradientcolor(){
        
        
        let gradient = CAGradientLayer()
        
        let blue = UIColor(red: 100/255.0, green: 80/255.0, blue: 190/255.0, alpha: 1/0)
        let orange = UIColor(red: 244/255.0, green: 88/255.0, blue: 53/255.0, alpha: 1/0)
        let pink = UIColor(red: 120/255.0, green: 70/255.0, blue: 107/255.0, alpha: 1/0)
        
        gradient.colors = [blue.cgColor, orange.cgColor, pink.cgColor]
        gradient.locations = [0.0 , 0.75 , 1.0]
        gradient.startPoint = CGPoint(x: 0.75, y: 1.75)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.frame
        self.view.layer.insertSublayer(gradient, at: 0)

    }

    
}


// login
extension Login_ViewController{
    
    func loginfunction(){
        print("Start.....")
        //self.insertintofcm_did()
        Alamofire.request("http://kolhapurtourism.co.in/ClassifiedApp/login.php?uid=\(self.email.text!)&pass=\(self.password.text!)").responseData { (resdata) in
            
            print(resdata.result.value as Any)
            let res = resdata.result.value
            
            let pop = String(data: res!, encoding: String.Encoding.utf8)
            print(pop!)
            if pop == "User#1"{
                
                let controller = UIAlertController(title: "Login", message: "Invalid username & password", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
                
            }else{
                
                let controller = UIAlertController(title: "Login", message: "Valid username & password", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
    
               self.performSegue(withIdentifier: "tabbarcontroller", sender: self)
                
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
    
            }
            
            
        }
    }

    
}

// Handle keyboard While typing...
 extension Login_ViewController{
    
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

// custom layer for textfields
extension Login_ViewController{
    
    func drawlineatbottmoftextfield(textfields:UITextField){
        
        
        let layers = CALayer()
        layers.backgroundColor = UIColor.darkGray.cgColor
        layers.frame = CGRect(x: 0.0, y: textfields.frame.size.height - 2.0, width:textfields.frame.size.width, height: 2.0)
        textfields.layer.addSublayer(layers)
    }

    
    
}

