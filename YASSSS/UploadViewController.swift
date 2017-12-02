//
//  UploadViewController.swift
//  YASSSS
//
//  Created by Annie Tung on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var addImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer()
        addImage.isUserInteractionEnabled = true
        addImage.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(openActionSheet))
    }

    @objc func openActionSheet() {
        let controller = UIAlertController(title: "Attach files", message: "", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Take a Photo", style: .default, handler: { alert in
            print(alert)
        })
        let photoAction = UIAlertAction(title: "Photo library", style: .default, handler: { alert in
            print(alert)
        })
        controller.addAction(cameraAction)
        controller.addAction(photoAction)
        self.present(controller, animated: true, completion: nil)
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
