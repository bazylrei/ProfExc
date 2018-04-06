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
  
  private var articleViewModels: [ArticleViewModel] = [ArticleViewModel]() {
    didSet {
      self.reloadCollectionViewClosure?()
    }
  }
  
  var selectedArticle: Article?
  
  var cellCount: Int {
    return articleViewModels.count
  }
  
  init(api: ArticlesAPIType) {
    self.articlesAPI = api
  }
  
  func fetch() {
    articlesAPI.downloadArticles() {[weak self] articles in
      var viewModels = [ArticleViewModel]()
      articles.forEach { article in
        guard let vm = self?.createArticleViewModel(article: article) else { return }
        viewModels.append(vm)
      }
      self?.articleViewModels = viewModels
    }
  }
  
  func getArticleViewModel(at indexPath: IndexPath) -> ArticleViewModel {
    return articleViewModels[indexPath.row]
  }
  
  func createArticleViewModel(article: Article) -> ArticleViewModel {
    let viewModel = ArticleViewModel(article: article)
    return viewModel
  }
  
}
