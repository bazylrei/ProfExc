//
//  ArticleDetailsVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 05/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleDetailsVC: UIViewController {
  
  var viewModel: ArticleViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel?.title
  }
  
}
