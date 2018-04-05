//
//  ArticleCollectionViewCell.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  func setup(with viewModel: ArticleViewModel, completion: @escaping (()->())) {
    titleLabel.text = viewModel.title
    if let urlString = viewModel.imageHref {
    imageView.loadAsyncImage(urlString: urlString) { [weak self] loadedImage in
      viewModel.image = loadedImage
      completion()
    }
    }
  }
}
