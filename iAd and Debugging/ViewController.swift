//
//  ViewController.swift
//  iAd and Debugging
//
//  Created by Yohannes Wijaya on 9/24/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    // MARK: - Stored Properties
    
    var bannerView: ADBannerView!
    
    // MARK: - Methods Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerView = ADBannerView(adType: .Banner)
        self.bannerView.translatesAutoresizingMaskIntoConstraints = false
        self.bannerView.delegate = self
        self.bannerView.hidden = true
        self.view.addSubview(self.bannerView)
        
        let viewsDictionary = ["bannerView": self.bannerView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegate Methods
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.bannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView.hidden = true
    }

}

