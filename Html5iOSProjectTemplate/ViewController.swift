//
//  ViewController.swift
//  IonicStarterAppWithSwift
//
//  Created by Bhuman Soni on 21/10/2014.
//  Copyright (c) 2014 Bhuman Soni. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {

    var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController()
        /* updateTitle() is one of the Javascript methods in the demo.js class that's included
         in the index.html file. We can call that method by injecting a WKUserScript show below*/
        
        let titleScript = WKUserScript(source: "updateTitle()",
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)
        contentController.addUserScript(titleScript)
        //we are adding this because we want demo.js to call Swift via the SwiftCall handler
       
        contentController.add(self, name: "swiftCall")
        contentController.add(self, name: "shareFromHTML")
        contentController.add(self, name: "quizDataFromAPI")
        
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.userContentController = contentController
        webView = WKWebView(frame: view.bounds, configuration: webViewConfig)
        
        if let urlStr = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "webStuff") {
            webView.loadFileURL(urlStr, allowingReadAccessTo: urlStr.deletingLastPathComponent())
        }
        self.view = webView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if  message.name == "swiftCall" {
            print(message.body)
        } else if message.name == "shareFromHTML" {
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
            present(activityViewController, animated: true, completion: nil)
        } else if message.name == "quizDataFromAPI" {
            guard let messageStr = message.body as? String else {
                return
            }
            let decoder = JSONDecoder()
            /*
             From the web front-end, we query an external API using
             XMLHttpRequest and send the data back to Swift. Here we can parse
             it using Swift backend. Just added here for debugging purposes
             */
            do{
                let quizData = try decoder.decode(Quiz.self, from: messageStr.data(using: .utf8)!)
                quizData.printDataToConsole()
            } catch _ {
                //error handling to be added?. not important for this repo at this stasge
            }
        }
    }
}
