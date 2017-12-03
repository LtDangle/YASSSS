//
//  ImageAPIClient.swift
//  YASSSS
//
//  Created by Lisa J on 12/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
import UIKit

class ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func loadImage(from urlStr: String,
                   completionHandler: @escaping (UIImage) -> Void,
                   errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {return}
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
