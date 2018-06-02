//
//  CameraVCViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
class CameraVCViewController: UIViewController,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegate,PinterestLayoutDelegate {

    var category = [AnyObject]()
    
    var imagedata = Data()
    var universalheight = CGFloat()
    var jsonstring = [String]()
    @IBOutlet var myview: UIView!
    @IBOutlet weak var collectionview: UICollectionView!
    var imagestr = ["1.jpg","3.jpg","2.jpg","4.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
    print("view didload")
      
        self.getsel_ios()
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        if let layout = collectionview.collectionViewLayout as? PinterestLayout{
     
            layout.delegate = self
           
        }
        
    }

    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell
        
            
     
            
            let url = self.category[indexPath.row]["img"]
           // print(url as Any)
            if let urls = NSURL(string: url as! String){
                
                if let data = NSData(contentsOf: urls as URL){
                    
                    if let imgurl = UIImage(data: data as Data){
                 
                        let datas = UIImageJPEGRepresentation(imgurl, 0.1)
                        let im = UIImage(data: datas!)
                        cell.myimageview.image = im
                        let xy = im?.size.height
                        //print(xy!)
                        
                    }
                }
            }
            
            
        let desc = self.category[indexPath.row]["desc"] as? String
        let price = self.category[indexPath.row]["price"] as? String
            let status = self.category[indexPath.row]["sell_status"] as? String
            if let chec = status{
                
                if chec == "1"{
                
                print("Sold at index path -->\(indexPath.row)")
                }
                
            }
       
        cell.desc.text = "  \(desc!)"
        cell.pricetag.text = "  Rs.\(price!)"
        cell.layer.cornerRadius = 3
        cell.clipsToBounds = true
        cell.layer.masksToBounds = true
        cell.myimageview.contentMode = .scaleAspectFill

        return cell
    
    }
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat{
        
    
//        var heights = CGFloat()
//        let ad = self.category[indexPath.row]
//        let urls = ad["img"] as? String
//        print("height and indexpath  \(indexPath.row) ---->>>>> \(urls!)")
//        if let url = URL(string: urls!){
//            
//            if let data = NSData(contentsOf: url){
//                
//                if let img = UIImage(data: data as Data){
//                    
//                    
//                    let hei = img.size.height
//                    heights  = hei
//                   
//                    return heights
//                    
//                }
//                
//            }
//            
//        }
//      
//    
       return 200
    
    }
    
    
    func getsel_ios(){
        
        
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("total","\(category.count)")
        return category.count
        
    }

}






