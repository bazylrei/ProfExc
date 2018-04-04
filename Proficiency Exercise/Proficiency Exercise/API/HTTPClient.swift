//
//  HTTPClient.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit
import SwiftyJSON

class HTTPClient: NSObject {
  
  func startConnection() {
    let urlPath: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"//"https://api.myjson.com/bins/1e3977"
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
        let json = JSON(str)
        print(json)
        
      }
    }
    task.resume()
  }
}
