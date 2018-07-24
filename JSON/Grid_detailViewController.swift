//
//  Grid_detailViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 08/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Social
import MessageUI
import Messages
class Grid_detailViewController: UIViewController,MKMapViewDelegate,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate {
    /*!
     @method     messageComposeViewController:didFinishWithResult:
     @abstract   Delegate callback which is called upon user's completion of message composition.
     @discussion This delegate callback will be called when the user completes the message composition.
     How the user chose to complete this task will be given as one of the parameters to the
     callback.  Upon this call, the client should remove the view associated with the controller,
     typically by dismissing modally.
     @param      controller   The MFMessageComposeViewController instance which is returning the result.
     @param      result       MessageComposeResult indicating how the user chose to complete the composition process.
     */
    @available(iOS 4.0, *)
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }

    
    var right =  UIBarButtonItem()
        
    @IBOutlet  var mymapview: MKMapView!

    @IBOutlet weak var submittedlabel: UILabel!
    
    
    @IBOutlet weak var heart_trailing_constraint: NSLayoutConstraint!
    @IBOutlet weak var heart_height_constraint: NSLayoutConstraint!
    
    @IBOutlet weak var heart_width_constraint: NSLayoutConstraint!
    
    @IBOutlet weak var test_label: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    var price_string = String()
    var title_string = String()
    var desc_string = String()
    var sell_string = String()
    
    var lat = String()
    var lng = String()
    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var like_btn: UIButton!
    @IBOutlet weak var descriptions: UILabel!
    
    @IBOutlet weak var desclabl_height_constraints: NSLayoutConstraint!
       
    var istaps = true
    var isbook = true
    
    @IBOutlet weak var mainimageview: UIImageView!
    var incomingstr = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
     self.setupbar()
        
        
        setupmapviewwithcordinates()
        //self.mymapview.delegate = self
        self.mymapview.showsUserLocation = true
        print(" Latitide--> \(lat) & Longitude---> \(lng)")
        
        let latf = Float.init(self.lat)
        print("LAtitude float--> \(String(describing: latf))")
        
        self.price_lbl.text = " Rs. \(price_string)"
        self.titles.text = title_string
        self.titles.sizeToFit()
        self.titles.setNeedsDisplay()
        self.descriptions.text = desc_string
        self.descriptions.sizeToFit()
        self.descriptions.setNeedsDisplay()
        
        self.submittedlabel.text = " This item was last updated on \(self.sell_string)"
        
        //checking where data contain nil of not
        let url = self.incomingstr
        if let url = URL(string:url) {
            print(url)
            if let data = NSData(contentsOf: url){
                if let img = UIImage(data: data as Data){
                    
                    self.mainimageview.image = img
                    
                }
            }
        }
    }
    
    
    func setupbar(){
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
    
    //setup map with incoming cordinates
    func setupmapviewwithcordinates(){
        
       
        let lt = Double.init(self.lat)
        let ln = Double.init(self.lng)
        
        
        if let lats = lt {
            
            if let lngs = ln{
                let location = CLLocationCoordinate2DMake(lats, lngs)
        let span = MKCoordinateSpanMake(0.04, 0.04)
        let region = MKCoordinateRegionMake(location, span)
        self.mymapview.setRegion(region, animated: true)
        
        let annotion = MKPointAnnotation()
        annotion.coordinate = location
        annotion.title = self.title_string
        self.mymapview.addAnnotation(annotion)
        
        }
        }
        
        
    }
    
   
    @IBAction func like(_ sender: UIButton) {
        
        if istaps {
            
            self.like_btn.transform = CGAffineTransform(scaleX: 2.2, y: 2.2)
            UIView.animate(withDuration: 0.45, animations: {
                self.like_btn.layer.transform = CATransform3DIdentity
            })
       
            self.like_btn.setBackgroundImage(UIImage(named:"heart1.png"), for: UIControlState.normal)
            
        }else {
            
            
            self.like_btn.setBackgroundImage(UIImage(named:"heart2.png"), for: UIControlState.normal)
        }
        istaps = !istaps
        
        
    }
    
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
    
    
        dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func rights(_ sender: Any) {
        
        if isbook {
    
            self.right.image = UIImage(named: "star2.png")
    
        }
        else{
            
            self.right.image = UIImage(named: "star1.png")
            
        }
        isbook = !isbook
        
    }
    
    
    @IBAction func Facebook_btn(_ sender: UIButton) {
        
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            
            let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebook?.add(URL(string: self.incomingstr))
            
        }else{
            
            
            let alert = UIAlertController(title: "Facebook", message: "You dont have any existing account..!", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
        }
    
    }
    @IBAction func Twitter_btn(_ sender: UIButton) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            
            let facebook = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            facebook?.add(URL(string: self.incomingstr))
            
        }else{
     
            let alert = UIAlertController(title: "Twitter", message: "You dont have any existing account..!", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
      
    }
    @IBAction func Whatsapp_btn(_ sender: UIButton) {
        
        
        
        
    }
    
    @IBAction func Sms_Btn(_ sender: UIButton) {
        
     
        
        UIApplication.shared.openURL(URL(string: "sms:+919766360186")!)
    }
    
    
    
    @IBAction func Email_btn(_ sender: UIButton) {
   
        
    }
    @IBAction func Native_btn(_ sender: Any) {
        
        
        let contain = self.incomingstr
     
        let activity = UIActivityViewController(activityItems: [contain], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        
      
        activity.excludedActivityTypes = [.airDrop , .mail , .message , .postToFacebook , .postToFlickr , .postToTencentWeibo , .postToTwitter , .postToVimeo , .postToWeibo , .print , .saveToCameraRoll]
        
        present(activity, animated: true, completion: nil)
       }
    
    @IBAction func report(_ sender: UIButton) {
      
    }
    
    @IBAction func mapview_button(_ sender: UIButton) {
 
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "push") as! Detail_Mapview_ViewController
        
        vc.incominglat = self.lat
        vc.incominglng = self.lng
        vc.incomingtitle = self.title_string
        vc.incomingdesc = self.desc_string
        self.navigationController?.pushViewController(vc, animated: true)
     
        
    }
  }

// MARK: - ZoomTransitionDestinationDelegate

extension Grid_detailViewController: ZoomTransitionDestinationDelegate {
    
    func transitionDestinationImageViewFrame(forward: Bool) -> CGRect {
        if forward {
            let x: CGFloat = 0.0
            let y = topLayoutGuide.length
            let width = view.frame.width
            let height = width * 2.0 / 3.0
            return CGRect(x: x, y: y, width: width, height: height)
        } else {
            return mainimageview.convert(mainimageview.bounds, to: view)
        }
    }
    
    func transitionDestinationWillBegin() {
        mainimageview.isHidden = true
    }
    
    func transitionDestinationDidEnd(transitioningImageView imageView: UIImageView) {
        mainimageview.isHidden = false
        mainimageview.image = imageView.image
    }
    
    func transitionDestinationDidCancel() {
        mainimageview.isHidden = false
    }
}


