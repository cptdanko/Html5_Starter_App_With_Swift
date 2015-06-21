//
//  ViewController.swift
//  IonicStarterAppWithSwift
//
//  Created by Bhuman Soni on 21/10/2014.
//  Copyright (c) 2014 Bhuman Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate{

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory:"www")
        let url = NSURL(string: path!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        self.webView.delegate = self
    }
    private func cancelNotifications(){
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        /*
        below is the code for cancelling specific notifications
        for n:AnyObject in UIApplication.sharedApplication().scheduledLocalNotifications {
            let not:UILocalNotification = n as UILocalNotification
            let alertBody = not.alertBody!
            if alertBody == "3" {
                UIApplication.sharedApplication().cancelLocalNotification(not)
            }
        }*/
    }
    private func printNotifications(){
        for n:AnyObject in UIApplication.sharedApplication().scheduledLocalNotifications {
            let not:UILocalNotification = n as! UILocalNotification
            println("alertBody:\(not.alertBody!)")
        }
    }
    private func setTestNotifications(){
        var date = NSDate()
        scheduleNotifications(date.dateByAddingTimeInterval(100), message: "1")
        scheduleNotifications(date.dateByAddingTimeInterval(10), message: "2")
        scheduleNotifications(date.dateByAddingTimeInterval(20), message: "3")
        scheduleNotifications(date.dateByAddingTimeInterval(30), message: "4")
        scheduleNotifications(date.dateByAddingTimeInterval(60), message: "5")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scheduleNotifications(date: NSDate, message: String) {
        let notification:UILocalNotification = UILocalNotification()
        notification.fireDate = date
        notification.timeZone = NSTimeZone.defaultTimeZone()
        notification.fireDate = date
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.alertBody = message
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let path = request.URL!.path?.lastPathComponent
        println("\(path!)")
        if path == "setNotifications" {
            setTestNotifications()
            return false
        } else if path == "cancelAllNotifications" {
            cancelNotifications()
            return false
        } else if path == "printNotificationsToConsole" {
            printNotifications()
            return false
        }
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }

}

