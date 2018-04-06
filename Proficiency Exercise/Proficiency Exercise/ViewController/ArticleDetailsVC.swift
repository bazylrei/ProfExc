//
//  ArticleDetailsVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 05/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleDetailsVC: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  
  var viewModel: ArticleViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = viewModel?.title
    if let image = viewModel?.image {
      imageView.image = image
    } else {
      guard let url = viewModel?.imageHref else { return }
      imageView.loadAsyncImage(urlString: url) {_ in }
    }
    descriptionTextView.text = viewModel?.desc
  }
  
}
