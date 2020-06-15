//
//  Quiz.swift
//  Html5iOSProjectTemplate
//
//  Created by Bhuman Soni on 15/6/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import Foundation
/*
 To parse the incoming quiz data that we receive from the
 web front-end.
 */
class Quiz: Decodable {
    var responseCode: Int? = nil
    var results: [Result]
    
    func printDataToConsole() {
        for result in results {
            print(result.category!)
            print(result.difficulty!)
            print("Question => \(result.question!)")
            print("Correct answer => \(result.correct_answer!)")
            if let iAns = result.incorrect_answers {
                for iAnswer in iAns {
                    print("Incorrect answer => \(iAnswer)")
                }
            }
        }
    }
}

class Result: Decodable {
    var category: String?
    var type: String?
    var difficulty: String?
    var question: String?
    var correct_answer: String?
    var incorrect_answers: [String]?
}
