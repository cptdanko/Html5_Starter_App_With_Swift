//
//  QuizDataFromAPI.swift
//  Html5iOSProjectTemplate
//
//  Created by Bhuman Soni on 1/7/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
import WebKit

class QuizDataFromAPI: Action {
    
    func processAction(message: WKScriptMessage, viewController: UIViewController){
       
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
