//
//  ViewController.swift
//  IonicStarterAppWithSwift
//
//  Created by Bhuman Soni on 21/10/2014.
//  Copyright (c) 2014 Bhuman Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "index", ofType: "html", inDirectory:"www")
        let url = NSURL(string: path!)
        
        let request = URLRequest(url: url! as URL)
        webView.loadRequest(request)
        webView.delegate = self
        
        //check the current user notification settings type
        
        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return }
        if settings.types == UIUserNotificationType() {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
    }
    private func cancelNotifications(){
        UIApplication.shared.cancelAllLocalNotifications()
    }
    private func printScheduledNotifications(){
        guard let notifications = UIApplication.shared.scheduledLocalNotifications else {
            return
        }
        
        for notification in notifications{
            print("alertBody:\( notification.alertBody!)")
        }
    }
    private func setTestNotifications(){
        let date = NSDate()
        scheduleNotifications(date: date.addingTimeInterval(100), message: "1")
        scheduleNotifications(date: date.addingTimeInterval(10), message: "2")
        scheduleNotifications(date: date.addingTimeInterval(20), message: "3")
        scheduleNotifications(date: date.addingTimeInterval(30), message: "4")
        scheduleNotifications(date: date.addingTimeInterval(60), message: "5")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scheduleNotifications(date: NSDate, message: String) {
        let notification:UILocalNotification = UILocalNotification()
        notification.fireDate = date as Date
        notification.timeZone = NSTimeZone.default
        notification.fireDate = date as Date
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.alertBody = message
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    // MARK: WebView delegate methods
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let path = request.url!.lastPathComponent
        if path == "shareContent" {
            share()
        }
        return true
    }
    func share() {
        let sharingContent = "For this example, let's just use some simple text.\nHtml5StarterAppWithSwift ROCKS!!!!!!"
        let activityViewController = UIActivityViewController(activityItems: [sharingContent], applicationActivities: nil)
        let excludeActivities = [
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToFlickr
        ]
        activityViewController.excludedActivityTypes = excludeActivities
        present(activityViewController, animated: true, completion: nil)
    }
}

