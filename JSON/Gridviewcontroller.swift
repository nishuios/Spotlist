
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SDWebImage
class Gridviewcontroller: UIViewController,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegate,PinterestLayoutDelegate,UICollectionViewDataSourcePrefetching {

    fileprivate var selectedImageView: UIImageView?
    @IBOutlet weak var menulayoutconstraints: NSLayoutConstraint!
    var reachability = NetworkReachabilityManager()
    var category = [AnyObject]()
    var glob_height = CGFloat()
    var imagedata = Data()
    var universalheight = [CGFloat]()
    var jsonstring = [String]()
    var imagearray = [UIImage]()
    var istapped = true
    @IBOutlet var myview: UIView!
    @IBOutlet weak var collectionview: UICollectionView!
  
    
     override func viewDidLoad() {
           super.viewDidLoad()
        print("view didload")
        self.getdata()
        self.getsel_ios()
                
//             self.myview.layer.cornerRadius  = self.myview.layer.frame.size.width / 2
//        self.myview.layer.masksToBounds = true
//        self.myview.clipsToBounds = true
        
        collectionview.delegate = self
        collectionview.dataSource = self
        if #available(iOS 10.0, *) {
            collectionview.prefetchDataSource = self
        } else {
            // Fallback on earlier versions
        }
        
        if let layout = collectionview.collectionViewLayout as? PinterestLayout{
     
            layout.delegate = self
           
        }
     
        self.reachability = NetworkReachabilityManager.init()
    
        let check = self.reachability
        
        if (check?.isReachable)!{
            print("internet availabel")
        }else
            if (!(check?.isReachable)!){
                
                print("no internet")
        }
        
        
        
    }
    
    func getdata() {
        var db = CGFloat()
        let cou = self.category.count
        
        for a in 0..<cou{
            
           let img = self.category[a]["img"] as! String
            if let url = URL(string: img){
                
                if let data = NSData(contentsOf: url){
                    
                    if let imgs = UIImage(data: data as Data){
                        
                        
                     db = imgs.size.height / 2.10
                        self.universalheight.append(db)
                        print(" --------------------------------------------\(self.universalheight[a])")
                    }
                }
            }
            
            
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        
    }
       
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell
            
            let url = self.category[indexPath.row]["img"]
            //print(url as Any)
            if let urls = URL(string: url as! String){
                
                cell.myimageview.sd_setImage(with: urls, placeholderImage: UIImage(named: "Spotlist.png"))
                
                print(cell.myimageview.sd_setImage(with: urls) as Any)
            }
            
                 let desc = self.category[indexPath.row]["desc"] as? String
    
    
           // print(desc!)
            let price = self.category[indexPath.row]["price"] as? String
            cell.desc.text = "  \(desc!)"
            cell.desc.sizeToFit()
            cell.desc.setNeedsDisplay()
            cell.pricetag.text = "  Rs.\(price!)"
            let status = self.category[indexPath.row]["sell_status"] as? String
            if let chec = status{
                
            if chec == "1"{
                
                //print("Sold at index path -->\(indexPath.row)")
                }
                
            }
       
        cell.layer.cornerRadius = 0
        cell.layer.masksToBounds  = true
        cell.clipsToBounds = true
        cell.myimageview.layer.cornerRadius = 0
        cell.myimageview.clipsToBounds = true
        cell.myimageview.layer.masksToBounds = true
        cell.myimageview.contentMode = .scaleAspectFill

        return cell
    
    }
    
        func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat{
     

         return 220.0
            
         
    }
  
    @IBAction func category_btn(_ sender: UIButton) {
        print("tap")
        
        if istapped {
        self.menulayoutconstraints.constant = 0
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        }else
        {
            self.menulayoutconstraints.constant = -1010
            
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
               
            }, completion: nil)

        }
        istapped = !istapped
        
        
    }
    
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
                   return self.category.count
    }
    
       
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let img = self.category[indexPath.row]["img"]
        
        let tit = self.category[indexPath.row]["title"]
        let desc = self.category[indexPath.row]["desc"]
        let price = self.category[indexPath.row]["price"]
        let selldates = self.category[indexPath.row]["selldate"]
        let lat = self.category[indexPath.row]["lat"]
        let lng = self.category[indexPath.row]["lng"]
        
        
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        selectedImageView = cell.myimageview
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "show") as?
        Grid_detailViewController
        
        
        vc?.incomingstr = img as! String
        vc?.desc_string = desc as! String
        vc?.price_string = price as! String
        vc?.title_string = tit as! String
        vc?.lat = lat as! String
        vc?.lng = lng as! String
        
        if let dts = selldates {
            let dateString2 = dts
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            dateFormatter.locale = Locale.init(identifier: "en_GB")
            
            
            let dateObj = dateFormatter.date(from: dateString2 as! String)
            if let ch = dateObj{
                
        
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                
                let dt = dateFormatter.string(from: ch)
                print("Dateobj: \(dateFormatter.string(from: dateObj!))")
                vc?.sell_string = dt

                
            }
            
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    // ANimating drop down view
    func animationfunc(){
        self.menulayoutconstraints.constant = -1010
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: nil)

        
    }
    // All Buttons
    
    @IBAction func everything(_ sender: Any) {
        print("everything")
        animationfunc()
    }
    @IBAction func newinyourarea(_ sender: UIButton) {
        print("new")
        animationfunc()
    }
    
    @IBAction func Giveaways(_ sender: Any) {
        print("Giveaways")
        animationfunc()
        
    }
    @IBAction func friendsfollowing(_ sender: UIButton) {
        print("friendsfollowing")
        animationfunc()
    }
    @IBAction func young(_ sender: UIButton) {
        print("young")
        animationfunc()
    }
    @IBAction func spring(_ sender: UIButton) {
        print("spring")
        animationfunc()
        
    }
    @IBAction func springfashion(_ sender: Any) {
        print("springfashion")
        animationfunc()
    }
    @IBAction func winterfashion(_ sender: UIButton) {
        print("winterfashion")
        animationfunc()
    }
    @IBAction func summerfashion(_ sender: UIButton) {
        print("summerfashion")
        animationfunc()
    }
    @IBAction func ourselections(_ sender: UIButton) {
        print("ourselections")
        animationfunc()
    }
    @IBAction func fashionandaccessory(_ sender: UIButton) {
        print("fashionandaccessory")
        animationfunc()
    }
    
    @IBAction func homeandgarden(_ sender: UIButton) {
        print("homeandgarden")
        animationfunc()
    }
    
    @IBAction func electronics(_ sender: UIButton) {
        print("electronics")
        animationfunc()
    }
    @IBAction func babyandchilds(_ sender: UIButton) {
        print("babyandchilds")
        animationfunc()
    }
    @IBAction func sportsandgame(_ sender: UIButton) {
        print("sportsandgame")
        animationfunc()
    }
    @IBAction func pets(_ sender: UIButton) {
        print("pets")
        animationfunc()
    }
    @IBAction func carandmotors(_ sender: UIButton) {
        print("carandmotors")
        animationfunc()
    }
    @IBAction func propertytoletsale(_ sender: Any) {
        print("propertytoletsale")
        animationfunc()
    }
    @IBAction func propertytosalebuy(_ sender: UIButton) {
        print("propertytosalebuy")
        animationfunc()
    }
    @IBAction func services(_ sender: UIButton) {
        print("services")
        animationfunc()
        
        
        
        
    }
    @IBAction func joboffered(_ sender: UIButton) {
        print("joboffered")
        animationfunc()
    }
    @IBAction func jobwanted(_ sender: UIButton) {
        print("jobwanted")
        animationfunc()
    }
    
    @IBAction func others(_ sender: UIButton) {
        print("others")
        animationfunc()
    }
    override func awakeFromNib() {
        
        
        self.tabBarController?.tabBar.barTintColor = UIColor.brown
        self.tabBarController?.tabBar.tintColor = UIColor.white
    }

    

}
// calling web service n configure incoming data from server
extension Gridviewcontroller{
    
    func getsel_ios(){
        
        print("getsell")
        let url = URL(string:"http://kolhapurtourism.co.in/ClassifiedApp/json/getsell_ios.php")
        
        
        Alamofire.request(url!).responseJSON { (dataresponse) in
            
            let result  = dataresponse.result
            
            if let result = result.value as? Dictionary<String,AnyObject>{
                
                let img = result["category"]
                self.category = img as! [AnyObject]
                print(self.category)
                self.collectionview.reloadData()
                
            }
            
            
        }
    }

}



// MARK: - UICollectionViewDelegateFlowLayout

extension Gridviewcontroller {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let space: CGFloat = 8.0
        let length = (collectionView.frame.width - space * 3.0) / 2.0
        return CGSize(width: length, height: length)
    }
}


// MARK: - ZoomTransitionSourceDelegate

extension Gridviewcontroller: ZoomTransitionSourceDelegate {
    
    func transitionSourceImageView() -> UIImageView {
        return selectedImageView ?? UIImageView()
    }
    
    func transitionSourceImageViewFrame(forward: Bool) -> CGRect {
        guard let selectedImageView = selectedImageView else { return CGRect.zero }
        return selectedImageView.convert(selectedImageView.bounds, to: view)
    }
    
    func transitionSourceWillBegin() {
        selectedImageView?.isHidden = true
    }
    
    func transitionSourceDidEnd() {
        selectedImageView?.isHidden = false
    }
    
    func transitionSourceDidCancel() {
        selectedImageView?.isHidden = false
    }
}



