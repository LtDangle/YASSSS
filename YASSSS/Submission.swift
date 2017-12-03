//
//  Submission.swift
//  YASSSS
//
//  Created by Lisa J on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct Submission: Codable {
    let title: String
    let date: String
    let location: String
    let category: String
    let imageExtension: [String]
    let status: String?
    let description: String
}
