//
//  ArticleCollectionViewCell.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet fileprivate weak var view: UIView!
  @IBOutlet fileprivate weak var titleLabel: UILabel!
  @IBOutlet fileprivate weak var imageView: UIImageView!
  
  public func setup(with viewModel: ArticleViewModel, completion: @escaping (()->())) {
    view.layer.cornerRadius = 8.0
    titleLabel.text = viewModel.title
    viewModel.image = viewModel.image ?? #imageLiteral(resourceName: "Default")
    imageView.image = viewModel.image
    completion()
    
    if let urlString = viewModel.imageHref {
      imageView.loadAsyncImage(urlString: urlString) { loadedImage in
        guard let loadedImage = loadedImage else { return }
        viewModel.image = loadedImage
        completion()
      }
    }
  }
}
