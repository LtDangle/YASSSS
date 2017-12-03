//
//  IssuesViewController.swift
//  YASSSS
//
//  Created by Lisa J on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var submissions = [Submission]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadSubmissionsData()
        self.tableView.dataSource = self
    }
    
    func loadSubmissionsData() {
        let urlStr = "https://yassss-ae86.restdb.io/rest/submissions?apikey=22bbac2fbe3f6958760e48ba1be97907648ba"
        let setSubmissionToOnlineSubmissions: ([Submission]) -> Void = { (onlineSubmissions: [Submission]) in
            self.submissions = onlineSubmissions
        }
        SubmissionAPIClient.manager.getSubmissions(from: urlStr,
                                                   completionHandler: setSubmissionToOnlineSubmissions,
                                                   errorHandler: {print($0)})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else {return}
        guard let issueDetailViewController = segue.destination as? IssuesDetailViewController else {return}
        guard let selectedCell = sender as? UITableViewCell else {return}
        
        let selectedSubmission = submissions[(tableView.indexPath(for: selectedCell)?.row)!]
        issueDetailViewController.selectedSubmission = selectedSubmission
    }
    
}

extension IssuesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return submissions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let submission = submissions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "submissionCell", for: indexPath)
        cell.textLabel?.text = submission.title.capitalized
        cell.detailTextLabel?.text = submission.location.capitalized
        
        
        return cell
    }
}


