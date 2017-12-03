//
//  SubmissionAPIClient.swift
//  YASSSS
//
//  Created by Lisa J on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class SubmissionAPIClient {
    private init() {}
    static let manager = SubmissionAPIClient()
    func getSubmissions(from urlStr: String, completionHandler: @escaping ([Submission]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let onlineSubmissions = try JSONDecoder().decode([Submission].self, from: data)
                completionHandler(onlineSubmissions)
            } catch let error {
                errorHandler(error)
                
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

