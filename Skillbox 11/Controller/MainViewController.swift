//
//  MainViewController.swift
//  Skillbox 11
//
//  Created by Антон Тимоненков on 09.06.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  @IBOutlet weak var segmentView: SegmentView!
  @IBOutlet weak var clockView: ClockView!
  @IBOutlet weak var buttonView: ButtonView!
  @IBAction func buttonClick(_ sender: Any) {
    switch buttonValue {
    case 1:
      buttonView.buttonColor = .white
    case 2:
      buttonView.buttonColor = .black
    default:
      return
    }
  }
  
  var buttonValue = 1
  override func viewDidLoad() {
    super.viewDidLoad()
    segmentView.delegate = self
  }
}

extension MainViewController: SegmentViewDelegate{
  func segmentPressed(_ segment: SegmentView, _ value: Int){
    switch value {
    case 1:
      view.backgroundColor = .white
      clockView.backgroundColor = UIColor(rgb: 0x006EB6)
      clockView.secondsColor = .green
      buttonView.title = "To lightside"
      buttonValue = 1
    case 2:
      view.backgroundColor = .black
      clockView.backgroundColor = .white
      clockView.secondsColor = .black
      buttonView.title = "To darkside"
      buttonValue = 2
    default: return
    }
  }
}
