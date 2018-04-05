//
//  ArticleCollectionViewCell.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  func setup(with viewModel: ArticleViewModel, completion: @escaping (()->())) {
    view.layer.cornerRadius = 8.0
    titleLabel.text = viewModel.title
    if viewModel.image != nil {
      imageView.image = #imageLiteral(resourceName: "Default")
      completion()
    }
    
    if let urlString = viewModel.imageHref {
    imageView.loadAsyncImage(urlString: urlString) { [weak self] loadedImage in
      if loadedImage != nil {
        viewModel.image = loadedImage!
      } else {
        DispatchQueue.main.async {
          self?.imageView.image = viewModel.image
        }
      }
      completion()
    }
    }
  }
}
