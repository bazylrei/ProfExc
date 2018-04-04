//
//  MainVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  lazy var viewModel: ArticleSetViewModel = {
    return ArticleSetViewModel(api: ArticlesAPI())
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    viewModel.presentErrorAlertClosure = {[weak self] error in
      DispatchQueue.main.async {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self?.present(alert, animated: true, completion: nil)
      }
    }
    viewModel.updateDownloadStatusClosure = {
      
    }
    viewModel.reloadCollectionViewClosure = {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
    viewModel.fetch()
  }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.titleLabel.text = viewModel.getArticleViewModel(at: indexPath).title
    return cell
  }
  
}
