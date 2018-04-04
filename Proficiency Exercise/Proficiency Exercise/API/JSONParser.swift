//
//  JSONParser.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit
import SwiftyJSON

class JSONParser: NSObject {

  func parseArticleData(json: JSON) -> [Article] {
    guard let articles = json["rows"].array else { return [] }
    var articleArray = [Article]()
    articles.forEach { json in
      let article = Article(json: json)
      articleArray.append(article)
    }
    return articleArray
  }
  
}
