//
//  HTTPClient.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol ArticleLoaderType {
  func fetchArticles(completion: @escaping ((JSON?) -> Void))
}

class HTTPClient: NSObject, ArticleLoaderType {
  
  func fetchArticles(completion: @escaping ((JSON?) -> Void)) {
    let urlPath: String = Constants.URL
    guard let url = URL(string: urlPath) else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        guard let data = data else { return }
        let str = String.init(data: data, encoding: String.Encoding.isoLatin1)
        if let utf8Data = str?.data(using: .utf8) {
          let json = JSON(data: utf8Data)
          completion(json)
        }
      }
    }
    task.resume()
  }
}
