//
//  IssuesDetailViewController.swift
//  YASSSS
//
//  Created by Lisa J on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class IssuesDetailViewController: UIViewController {
    
    @IBOutlet weak var issueTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionlabel: UITextView!
    
    var selectedSubmission: Submission!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadViews()
    }
    
    func loadViews() {
        self.issueTitleLabel.text = selectedSubmission.title
        self.dateLabel.text = selectedSubmission.date
        self.locationLabel.text = selectedSubmission.location
        self.categoryLabel.text = selectedSubmission.category
        self.statusLabel.text = selectedSubmission.status ?? ""
        self.descriptionlabel.text = selectedSubmission.description
        self.imageView.image = nil
        if let imageExtension = selectedSubmission.imageExtension.first {
            let urlStr = "https://yassss-ae86.restdb.io/media/\(imageExtension)"
            let setImageToOnlineImage: (UIImage) -> Void = {(onlineImage: UIImage) in
                self.imageView.image = onlineImage
                self.imageView.setNeedsLayout()
            }
            ImageAPIClient.manager.loadImage(from: urlStr, completionHandler: setImageToOnlineImage, errorHandler: {print($0)})
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
