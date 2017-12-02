//
//  FrontPageViewController.swift
//  YASSSS
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FrontPageViewController: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
//    @IBOutlet weak var
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FrontPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        
        return cell
    }
}
