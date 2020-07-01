//
//  PrintToConsole.swift
//  Html5iOSProjectTemplate
//
//  Created by Bhuman Soni on 1/7/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import WebKit

class PrintToConsole: Action {
    
    func processAction(message: WKScriptMessage, viewController: UIViewController){
        print(message)
    }
}
