//
//  Actions.swift
//  Html5iOSProjectTemplate
//
//  Created by Bhuman Soni on 1/7/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import UIKit
import WebKit

protocol Action {
    /*
     The view controller maybe used by some actions that may present dialogs
     to the user.
     */
    func processAction(message: WKScriptMessage, viewController: UIViewController)
}

/*
 We don't want to expose the actionsMap, we keep that hidden
 so we don't expose it
 */
class ActionFactory {
    
    private var actionsMap = [String: Action]()
    /*
     Build a map of actions so at any point, so any any point, we can
     grab a relevant action for what we want to do
     */
    init() {
        actionsMap["swiftCall"] = PrintToConsole()
        actionsMap["shareFromHTML"] = ShareFromHTML()
        actionsMap["quizDataFromAPI"] = QuizDataFromAPI()
    }
    
    func getAction(key: String) -> Action? {
        //trying to retrieve values via a subscript always
        //returns an optional so have to unwrap
        return actionsMap[key]
    }
}
