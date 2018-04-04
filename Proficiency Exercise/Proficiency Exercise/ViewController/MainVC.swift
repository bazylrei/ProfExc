//
//  MainVC.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    HTTPClient().startConnection()
  }
}
