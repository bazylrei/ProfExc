//
//  UIImage+Sizing.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 06/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit

extension UIImage {
  func getHeightFittingScreen() -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    if screenWidth < self.size.width {
      return (self.size.height / self.size.width) * screenWidth
    } else {
      return self.size.height
    }
  }
}
