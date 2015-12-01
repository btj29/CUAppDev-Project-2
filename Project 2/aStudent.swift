//
//  aStudent.swift
//  Project 2
//
//  Created by Bernard JIANG on 5/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class aStudent: NSObject {
    var name = ""
    var year = 0
    var major = ""
    var gpa = 0.0
    var birthday = ""
    
    init( withName name: String, inYear year: Int, studying major: String, withGpa gpa: Double, bornOn birthday: String) {
        self.name = name
        self.year = year
        self.major = major
        self.gpa = gpa
        self.birthday = birthday
    }
    
    func getFirstName() -> String {
        let index = name.characters.indexOf(" ")
        if index == nil {
            return name
        }
        return name.substringToIndex(index!)
    }
    
    override var description: String {
        return getFirstName() + " is born on \(birthday) and is majoring in \(major) with a \(gpa)"
    }
}
