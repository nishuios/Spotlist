//
//  VC_TEST.swift
//  JSON
//
//  Created by Umbrella System on 7/24/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
class VC_TEST: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {


    @IBOutlet weak var collectionview: UICollectionView!
    

    
    var category = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.getsel_ios()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count / 50
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell_test
        if let urlstr = self.category[indexPath.row]["img"]{
            if let url = URL(string: (urlstr as? String)!){
            cell.myimageview.sd_setImage(with: url as? URL)
            cell.myimageview.setNeedsDisplay()
        }
        }
        
        return cell
        
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

}
