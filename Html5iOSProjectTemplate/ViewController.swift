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
    let actionFactory = ActionFactory()
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
        guard let action = actionFactory.getAction(key: message.name) else {
            print("Cannot find the action! Are you sure you are asking for the right thing?")
            return 
        }
        action.processAction(message: message, viewController: self)
    }
}
