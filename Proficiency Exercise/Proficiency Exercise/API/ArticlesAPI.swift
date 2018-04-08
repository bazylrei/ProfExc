//
//  ArticlesAPI.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

protocol ArticlesAPIType {
  var parser: ParserType { get }
  var networkClient: ArticleLoaderType { get }
  func downloadArticles(completion: @escaping (([Article]) -> Void))
}

class ArticlesAPI: NSObject, ArticlesAPIType {
  
  internal let parser: ParserType = JSONParser()
  let networkClient: ArticleLoaderType = HTTPClient()
  
  internal func downloadArticles(completion: @escaping (([Article]) -> Void)) {
    networkClient.fetchArticles() { [weak self] json in
      guard let json = json else { return }
      guard let articles = self?.parser.parseArticleData(json: json) else { return }
      completion(articles)
    }
  }
}
