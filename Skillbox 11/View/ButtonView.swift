//
//  CustomButton.swift
//  Skillbox 11
//
//  Created by Антон Тимоненков on 05.06.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonView: UIButton {
  @IBInspectable
  var title: String?{
    didSet{
      setTitle(title, for: UIControl.State())
    }
  }
  @IBInspectable
  var titleSize: CGFloat = 25{
    didSet{
      self.titleLabel?.font = .systemFont(ofSize: titleSize)
    }
  }
  @IBInspectable
  var titleColor: UIColor?{
    didSet{
      setTitleColor(titleColor, for: UIControl.State())
    }
  }
  @IBInspectable
  var buttonColor: UIColor?{
    didSet{
      layer.backgroundColor = buttonColor?.cgColor
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
    }
  }
}
