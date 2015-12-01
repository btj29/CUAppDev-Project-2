//
//  ViewController.swift
//  Project 2
//
//  Created by Bernard JIANG on 30/9/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentList: UITextView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var majorInput: UITextField!
    @IBOutlet weak var gpaInput: UITextField!
    @IBOutlet weak var sortingTabs: UISegmentedControl!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    
    var students = [aStudent]()
    var sortedList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        birthdayLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func addStudent(sender: UIButton) {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        let birthday = formatter.stringFromDate(birthdayPicker.date)
        
        let student = aStudent(withName: nameInput.text!, inYear: Int(yearInput.text!)!, studying: majorInput.text!, withGpa: Double(gpaInput.text!)!, bornOn: birthday)
        
        birthdayLabel.hidden = false
        birthdayLabel.text = birthday
        
        if student.year >= 2016 && student.year <= 2019 && student.gpa >= 0 && student.gpa <= 4.33 {
            
            students.append(student)
        }
        
        switch sortingTabs.selectedSegmentIndex {
        case 0:
            students = students.sort({$0.name < $1.name})
            
        case 1:
            students = students.sort({$0.year < $1.year})
            
        case 2:
            students = students.sort({$0.gpa < $1.gpa})
            
        default:
            break
        }
        
        sortedList = []
        for student in students {
            sortedList.append(student.description)
        }
        studentList.text = sortedList.joinWithSeparator("\n")
    }
    
    @IBAction func sortByCategory(sender: UISegmentedControl) {
        switch sortingTabs.selectedSegmentIndex {
        case 0:
            students = students.sort({$0.name < $1.name})
            
        case 1:
            students = students.sort({$0.year < $1.year})
            
        case 2:
            students = students.sort({$0.gpa < $1.gpa})
        
        default:
            break
        }
        
        sortedList = []
        for student in students {
            sortedList.append(student.description)
        }
        studentList.text = sortedList.joinWithSeparator("\n")
    }
}










