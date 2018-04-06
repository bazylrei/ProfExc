//
//  MainVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

  let kDetailsSegue = "DetailsSegue"
  let kArticleCell = "ArticleCell"
  
  @IBOutlet weak var collectionView: UICollectionView!

  let refreshController = UIRefreshControl()
  
  lazy var viewModel: ArticleSetViewModel = {
    return ArticleSetViewModel(api: ArticlesAPI())
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewModel()
    setupCollectionView()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == kDetailsSegue {
      if let vc = segue.destination as? ArticleDetailsVC,
        let viewModel = sender as? ArticleViewModel {
        vc.viewModel = viewModel
      }
    }
  }
  
  func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    refreshController.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    collectionView.addSubview(refreshController)
    
  }
  
  func setupViewModel() {
    
    viewModel.reloadCollectionViewClosure = {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
        self.refreshController.endRefreshing()
      }
    }
    refreshData()
  }
  
  @objc func refreshData() {
    refreshController.beginRefreshing()
    viewModel.fetch()
  }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kArticleCell,
                                                        for: indexPath) as? ArticleCollectionViewCell else {
      return UICollectionViewCell()
    }
    let articleViewModel = viewModel.getArticleViewModel(at: indexPath)
    cell.setup(with: articleViewModel) { [weak self] in
      DispatchQueue.main.async {
        self?.collectionView.collectionViewLayout.invalidateLayout()
      }
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var height: CGFloat = 40.0
    if let img = viewModel.getArticleViewModel(at: indexPath).image {
      height += img.getHeightFittingScreen()
    }
    let size = CGSize(width: self.collectionView.frame.width, height: height)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    let articleViewModel = viewModel.getArticleViewModel(at: indexPath)
    performSegue(withIdentifier: kDetailsSegue, sender: articleViewModel)
  }
}
