//
//  ViewController.swift
//  collectionviewtuto
//
//  Created by Humpty on 23/05/18.
//  Copyright © 2018 Humpty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,PinterestLayoutDelegate {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var cars:[String]=["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionview.layer.backgroundColor = UIColor.clear.cgColor
        if let layout = collectionview.collectionViewLayout as? PinterestLayout{
            
            layout.delegate = self
            
            
        }
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat{
        
        let imagesize = UIImage(named:cars[indexPath.row])
        
        if let heig = imagesize?.size.height{
            
            
            
            
            
            return heig / 4
        }
        
        return 0.0
        
        
        
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? CollectionViewCell
        
        cell?.collectionviewcell.image = UIImage(named: cars[indexPath.row])
        cell?.collectionviewcell.contentMode = .scaleAspectFill
        cell?.mylabel.text = cars[indexPath.row] as? String

        
        cell?.layer.cornerRadius = 10
        cell?.clipsToBounds = true
        cell?.layer.masksToBounds = true
        cell?.layer.borderWidth = 0.90
        cell?.layer.borderColor = UIColor.brown.cgColor
        
        cell?.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell!
        
        
    }


}

