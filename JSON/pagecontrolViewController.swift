//
//  pagecontrolViewController.swift
//  JSON
//
//  Created by Umbrella Systems on 08/06/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit

class pagecontrolViewController: UIViewController,UIScrollViewDelegate {

   
    @IBOutlet weak var myscrollview: UIScrollView!
    
    @IBOutlet weak var mypagecontrol: UIPageControl!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    var imagearray:[String] = ["pic1.jpg","pic2.jpg","pic3.jpg","pic4.jpeg","pic5.jpg","pic6.jpg","pic7.jpg"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // setuping the image slider
        
        
        self.mypagecontrol.numberOfPages = self.imagearray.count
        for index in 0..<self.imagearray.count{
            
        frame.origin.x = myscrollview.frame.size.width * CGFloat(index)
        frame.size = myscrollview.frame.size
        let imageview = UIImageView(frame: frame)
        imageview.image = UIImage(named: self.imagearray[index])
        self.myscrollview.addSubview(imageview)
            
            
        }
        myscrollview.contentSize = CGSize(width: self.myscrollview.frame.width * CGFloat(imagearray.count), height: myscrollview.frame.size.height)
        myscrollview.delegate = self
        

    
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        let pagenumber = myscrollview.contentOffset.x / scrollView.frame.size.width
        mypagecontrol.currentPage = Int(pagenumber)
    }
    @IBAction func pagecontrol(_ sender: Any) {
        
        
    }

    @IBAction func loginwithemails(_ sender: UIButton) {
    }
   
}
