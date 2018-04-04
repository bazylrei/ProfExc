//
//  ArticleSetViewModel.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleSetViewModel: NSObject {
  
  private let articlesAPI: ArticlesAPIType
  private let articles: [Article] = [Article]()

  var reloadCollectionViewClosure: (()->())?
  var updateDownloadStatusClosure: (()->())?
  var presentErrorAlertClosure: ((String)->())?
  
  private var articleViewModels: [ArticleViewModel] = [ArticleViewModel]() {
    didSet {
      self.reloadCollectionViewClosure?()
    }
  }
  
  var selectedArticle: Article?
  
  var isDownloading: Bool = false {
    didSet {
      updateDownloadStatusClosure?()
    }
  }
  
  var errorMessage: String? {
    didSet {
      guard let error = errorMessage else { return }
      presentErrorAlertClosure?(error)
    }
  }
  
  var cellCount: Int {
    return articleViewModels.count
  }
  
  init(api: ArticlesAPIType) {
    self.articlesAPI = api
  }
  
//  articlesAPI.downloadArticles() { articles in
//  articles.forEach { article in
//  print(article.title)
//  }
//  }
}
