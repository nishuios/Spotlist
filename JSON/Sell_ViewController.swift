//
//  Sell_ViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 29/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit

class Sell_ViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var mainimageview: UIImageView!
    @IBOutlet weak var titles: UITextField!
    @IBOutlet weak var descriptions: custom_textview!
    @IBOutlet weak var selectcurrencytype: Custom_Textfields!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var shareOnFB: UISwitch!
    @IBOutlet weak var selectcategory: UITextField!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var fb_label: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    
    var imagepickercontroller = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagepickercontroller.delegate = self
        self.imagepickercontroller.allowsEditing = true
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Selectphotos(_ sender: UIBarButtonItem) {
        
        let controller = UIAlertController(title: "Spotlist", message: "Select Photo Source", preferredStyle: .alert)
        
    
        let photolibrary = UIAlertAction(title: "Photo Library", style: .default) { (action ) in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                self.imagepickercontroller.sourceType = .photoLibrary
                self.imagepickercontroller.allowsEditing = true
                self.imagepickercontroller.delegate = self
                self.present(self.imagepickercontroller, animated: true, completion: nil)
            }
            
            
            print("photo library")
        }
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            print("Camera")
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                self.imagepickercontroller.sourceType = .camera
                self.imagepickercontroller.allowsEditing = true
                self.imagepickercontroller.delegate = self
                self.present(self.imagepickercontroller, animated: true, completion: nil)
            }else{
                let controller = UIAlertController(title: "Camera", message: "Camera is not working...", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
                
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
            }

        }
        
        
        controller.addAction(photolibrary)
        controller.addAction(camera)
        present(controller, animated: true, completion: nil)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.mainimageview.image = image
            dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sell(_ sender: UIButton) {
    print("Sell")
    }

    @IBAction func selectCurrency(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "Currency Type", message: "Select Currency Type", preferredStyle: .alert)
        
        let INR = UIAlertAction(title: "Euro - EUR", style: .default) { (action) in
            self.selectcurrencytype.text = "EUR"
            }
        let EUR = UIAlertAction(title: "US Dollar - USD", style: .default) { (action) in
            self.selectcurrencytype.text = "USD"
        }
        let USD = UIAlertAction(title: "British Pound - GBP", style: .default) { (action) in
            self.selectcurrencytype.text = "USD"
        }
        let GBP = UIAlertAction(title: "Swiss Franc - CHF", style: .default) { (action) in
            self.selectcurrencytype.text = "CHF"
        }
        let CHF = UIAlertAction(title: "Swedish Krones - SEK", style: .default) { (action) in
            self.selectcurrencytype.text = "SEK"
        }
        let NOK = UIAlertAction(title: "Norwegian Krone - NOK", style: .default) { (action) in
            self.selectcurrencytype.text = "NOK"
        }
        let SEK = UIAlertAction(title: "₹ - INR", style: .default) { (action) in
            self.selectcurrencytype.text = "INR"
        }
        controller.view.tintColor = UIColor.brown
       
        controller.addAction(INR)
        controller.addAction(EUR)
        controller.addAction(USD)
        controller.addAction(GBP)
        controller.addAction(CHF)
        controller.addAction(NOK)
        controller.addAction(SEK)
        
        
       //self.navigationController?.popToViewController(controller, animated: true)
        self.present(controller, animated: true, completion: nil)
        
    print("selectCurrency")
    
    }
    
    @IBAction func selectCategory_btn(_ sender: UIButton){
        print("selectcategory")
        
    }
    @IBAction func shareonfb_btn(_ sender: UISwitch) {
        print("shareonfb_btn")
        
        
        
        if shareOnFB.isOn{
            
            self.fb_label.textColor = UIColor.blue
            
        }
        else if !shareOnFB.isOn{
            self.fb_label.textColor = UIColor.darkGray
        }
        
    }
    
}

extension Sell_ViewController  {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let scroll:CGPoint = CGPoint(x: 0, y: 100)
        self.scrollview.setContentOffset(scroll, animated: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let zero = CGPoint.init(x: 0, y: -11)
        self.scrollview.setContentOffset(zero, animated: true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension Sell_ViewController{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let point = CGPoint(x: 0, y: 250)
        textView.setContentOffset(point, animated: true)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        let point = CGPoint(x: 0, y: 0)
        textView.setContentOffset(point, animated: true)

    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
     func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    
    
}
