//
//  ViewController.swift
//  ScrollViewWithPageControl
//
//  Created by Greeens5 on 12/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet var pagerControl: UIPageControl!
    
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    
    var images = [UIImage(named: "ABD-1"), UIImage(named: "Abd")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 300)
        scrollView.backgroundColor = UIColor.white
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        
        for i in 0..<images.count {
            
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: 500)
            imageView.image = images[i]
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i+1)
            scrollView.addSubview(imageView)
            
        }
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 2, height: self.scrollView.frame.size.height)
        
        pagerControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changePage(sender:AnyObject) -> () {
        
        let x = CGFloat(pagerControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pagerControl.currentPage = Int(pageNumber)
        
        super.viewDidLoad()
    }

}

