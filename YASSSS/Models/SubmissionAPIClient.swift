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
    func post(issue: Submission, errorHandler: @escaping (Error) -> Void) {
        let urlStr = "https://yassss-ae86.restdb.io/rest/submissions?apikey=22bbac2fbe3f6958760e48ba1be97907648ba"
        guard var postRequest = buildRequest(from: urlStr,httpVerb: .POST) else {errorHandler(AppError.badURL); return}
        do {
            let encodedElement = try JSONEncoder().encode(issue)
            postRequest.httpBody = encodedElement
            NetworkHelper.manager.performDataTask2(with: postRequest, completionHandler: {_ in print("Made a post request")}, errorHandler: errorHandler)
        } catch {
            errorHandler(AppError.codingError(rawError: error))
        }
    }
    private func buildRequest(from urlStr: String, httpVerb: HTTPVerb) -> URLRequest? {
        guard let url = URL(string: urlStr) else {return nil}
        var request = URLRequest(url:url)
        if httpVerb == .POST {
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //tells API to expect to get json
        }
        return request
    }
}

