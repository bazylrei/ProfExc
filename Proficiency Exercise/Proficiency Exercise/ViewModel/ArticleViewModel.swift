//
//  ArticleViewModel.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleViewModel: NSObject {
  let title: String
  let desc: String
  let imageHref: String?
  var image = UIImage()
  
  init(article: Article) {
    self.title = article.title ?? ""
    self.desc = article.desc ?? ""
    self.imageHref = article.imageHref
    super.init()
  }
}
