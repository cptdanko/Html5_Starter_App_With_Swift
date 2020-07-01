//
//  ShareFromHTML.swift
//  Html5iOSProjectTemplate
//
//  Created by Bhuman Soni on 1/7/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ShareFromHTML: Action {
    
    func processAction(message: WKScriptMessage, viewController: UIViewController) {
        guard let messageBody = message.body as? [String: Any] else {
            return
        }
        let task = messageBody["task"] as! String
        let time = messageBody["time"] as! String
        let activityViewController = UIActivityViewController(activityItems: ["\(task) at \(time)"], applicationActivities: nil)
        let excludeActivities = [
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToFlickr
        ]
        activityViewController.excludedActivityTypes = excludeActivities
        //now, how do we sent this back to the controller?
        viewController.present(activityViewController, animated: true, completion: nil)
    }
}
