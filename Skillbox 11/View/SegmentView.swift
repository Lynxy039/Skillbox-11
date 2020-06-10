//
//  SegmentView.swift
//  Skillbox 11
//
//  Created by Антон Тимоненков on 07.06.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

protocol SegmentViewDelegate: NSObjectProtocol{
  func segmentPressed(_ segment: SegmentView, _ value: Int)
}

@IBDesignable
class SegmentView: UIView {
  var isSetuped = false
  var segmentSize: CGFloat{get{frame.size.width/2}}
  weak var delegate: SegmentViewDelegate?

  // MARK: - views
  
  let leftSegment = UIButton()
  let rightSegment = UIButton()
  let movingSegment = UIView()
  
  //MARK: - settings
  @IBInspectable
  var leftTitle: String?{
    didSet{
      leftSegment.setTitle(leftTitle, for: UIControl.State())
    }
  }
  @IBInspectable
  var rightTitle: String?{
    didSet{
      rightSegment.setTitle(rightTitle, for: UIControl.State())
    }
  }
  @IBInspectable
  var titleSize: CGFloat = 25{
    didSet{
      leftSegment.titleLabel?.font = .systemFont(ofSize: titleSize)
      rightSegment.titleLabel?.font = .systemFont(ofSize: titleSize)
    }
  }
  @IBInspectable
  var titleColor: UIColor?{
    didSet{
      leftSegment.setTitleColor(titleColor, for: UIControl.State())
      rightSegment.setTitleColor(titleColor, for: UIControl.State())
    }
  }
  @IBInspectable
  var switchColor: UIColor?{
    didSet{
      movingSegment.layer.backgroundColor = switchColor?.cgColor
    }
  }
  @IBInspectable
  var borderWigth: CGFloat = 0{
    didSet{
      layer.borderWidth = borderWigth
    }
  }
  @IBInspectable
  var borderColor: UIColor?{
    didSet{
      layer.borderColor = borderColor?.cgColor
    }
  }

  @IBInspectable
  var cornerRadius: CGFloat = 0{
    didSet{
      layer.cornerRadius = cornerRadius
      movingSegment.layer.cornerRadius = cornerRadius
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    let h = frame.size.height
    
    leftSegment.frame = CGRect(x: 0, y: 0, width: segmentSize, height: h)
    rightSegment.frame = CGRect(x: segmentSize, y: 0, width: segmentSize, height: h)
    movingSegment.frame = CGRect(x: 0, y: 0, width: segmentSize, height: h)
      
    leftSegment.addTarget(self, action: #selector(selectLeft), for: .touchDown)
    rightSegment.addTarget(self, action: #selector(selectRight), for: .touchDown)

    if isSetuped {return}
    isSetuped = true
    
    addSubview(movingSegment)
    addSubview(leftSegment)
    addSubview(rightSegment)
  }

  @objc func selectLeft(sender : UITapGestureRecognizer) {
    let h = frame.size.height
    UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
      self.movingSegment.frame = CGRect(x: 0, y: 0, width: self.segmentSize, height: h)
    })
    delegate?.segmentPressed(self, 1)
  }
  @objc func selectRight(sender : UITapGestureRecognizer) {
    let h = frame.size.height
    UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
      self.movingSegment.frame = CGRect(x: self.segmentSize, y: 0, width: self.segmentSize, height: h)
    })
    delegate?.segmentPressed(self, 2)
  }
}
