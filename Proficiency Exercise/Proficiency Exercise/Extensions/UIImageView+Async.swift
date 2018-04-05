//
//  UIImageView+Async.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

extension UIImageView {
  public func loadAsyncImage(urlString: String, completion: @escaping ((UIImage)->())) {
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) in
      if error != nil {
        print(error)
      } else {
        DispatchQueue.main.async(execute: { () -> Void in
          guard let image = UIImage(data: data!) else { return }
          self.image = image
          completion(image)
        })
      }
    })
    task.resume()
  }
}
