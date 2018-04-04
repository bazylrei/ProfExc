//
//  Article.swift
//  Proficiency Exercise
//
//  Created by Bazyl Reinstein on 04/04/2018.
//  Copyright © 2018 Bazyl Reinstein. All rights reserved.
//

import UIKit
import SwiftyJSON

class Article: NSObject {
  let title: String?
  let desc: String?
  let imageHref: String?
  
  init(json: JSON) {
    self.title = ""
    self.desc = ""
    self.imageHref = ""
    super.init()
  }
}
