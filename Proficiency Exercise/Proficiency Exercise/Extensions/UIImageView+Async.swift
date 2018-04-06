//
//  UIImageView+Async.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

extension UIImageView {
  public func loadAsyncImage(urlString: String, completion: @escaping ((UIImage?) -> ())) {
    let session = URLSession(configuration: .default)
    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
      if let data = data,
        let image = UIImage(data: data) {
        DispatchQueue.main.async {
          self.image = image
          completion(image)
        }
      } else {
        completion(nil)
      }
    })
    task.resume()
  }
}
