//
//  TodayViewController.swift
//  TodayWidget
//
//  Created by Bhuman Soni on 27/03/2016.
//  Copyright © 2016 Bhuman Soni. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UIWebViewDelegate {
        
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "widget", ofType: "html", inDirectory:"www")
        let url = NSURL(string: path!)
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
        
        self.webView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //add this method below to get all the space in the Widget
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        let left = CGFloat(2), right = CGFloat(2), bottom = CGFloat(5), top = CGFloat(5)
        return UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
    }
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.newData)
    }
    
}
