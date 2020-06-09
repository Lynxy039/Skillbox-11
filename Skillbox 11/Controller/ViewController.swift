//
//  ViewController.swift
//  Skillbox 11
//
//  Created by Антон Тимоненков on 04.06.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var delegate: SegmentViewDelegate?
  override func viewDidLoad() {
    super.viewDidLoad()

  }

}
extension ViewController: SegmentViewDelegate{
  func segmentPressed(_ segment: UIView, _ value: Int){
    print (1)
  }
}
