//
//  MainVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  let articlesAPI = ArticlesAPI()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    articlesAPI.downloadArticles() { articles in
      articles.forEach { article in
        print(article.title)
      }
    }
  }
}
