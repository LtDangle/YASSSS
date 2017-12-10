//
//  ViewController.swift
//  YASSSS
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class SubmissionsViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
  
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let title = self.titleTextField.text  else {return}
        guard let date = self.dateTextField.text else {return}
        guard let location = self.locationTextField.text else {return}
        guard let category =
            self.categoryTextField.text else {return}
        guard let status = self.statusTextField.text else {return}
        guard let description = self.descriptionTextView.text else {return}
        print(date, location, category)
        self.titleTextField.text = ""
        self.dateTextField.text = ""
        self.locationTextField.text = ""
        self.categoryTextField.text = ""
        self.statusTextField.text = ""
        self.descriptionTextView.text = ""
        //Make POST request with the above
        let newSubmission = Submission(title: title, date: date, location: location, category: category, imageExtension: ["N/A"], status: status, description: description)
        SubmissionAPIClient.manager.post(issue: newSubmission, errorHandler: {print($0)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}

