//
//  Question.swift
//  Quizzler2
//
//  Created by Admin on 8/8/1439 AH.
//  Copyright © 1439 AH Admin. All rights reserved.
//

import Foundation

class Question {
    var question :String!
    var correctAnswer :Bool!
    
    init(text:String,answer:Bool) {
        question = text
        correctAnswer = answer
    }
}
