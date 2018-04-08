//
//  ArticleSetViewModel.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleSetViewModel: NSObject {
  
  fileprivate let articlesAPI: ArticlesAPIType
  fileprivate let articles: [Article] = [Article]()

  var reloadCollectionViewClosure: (()->())?
  
  fileprivate var articleViewModels: [ArticleViewModel] = [ArticleViewModel]() {
    didSet {
      self.reloadCollectionViewClosure?()
    }
  }
  
  fileprivate var selectedArticle: Article?
  
  public var cellCount: Int {
    return articleViewModels.count
  }
  
  init(api: ArticlesAPIType) {
    self.articlesAPI = api
  }
  
  public func fetch() {
    articlesAPI.downloadArticles() {[weak self] articles in
      var viewModels = [ArticleViewModel]()
      articles.forEach { article in
        guard let vm = self?.createArticleViewModel(article: article) else { return }
        viewModels.append(vm)
      }
      self?.articleViewModels = viewModels
    }
  }
  
  public func getArticleViewModel(at indexPath: IndexPath) -> ArticleViewModel {
    return articleViewModels[indexPath.row]
  }
  
  fileprivate func createArticleViewModel(article: Article) -> ArticleViewModel {
    let viewModel = ArticleViewModel(article: article)
    return viewModel
  }
  
}
