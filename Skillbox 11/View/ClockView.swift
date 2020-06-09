//
//  ClockView.swift
//  Skillbox 11
//
//  Created by Антон Тимоненков on 06.06.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
  var isSetuped = false
  
  // MARK: - views
  private let topMarker = UIView()
  private let leftMarker = UIView()
  private let bottomMarker = UIView()
  private let rightMarker = UIView()
  private let centerMarker = UIView()
  private let hoursArrow = UIView()
  private let minutesArrow = UIView()
  private let secondsArrow = UIView()
  
  // MARK: - markers/border settings
  @IBInspectable
  var markerSize: CGFloat = 5
  @IBInspectable
  var markerLenght: CGFloat = 10
  @IBInspectable
  var centralMarkerSize: CGFloat = 12
  @IBInspectable
  var markerColor: UIColor?{
    didSet{
      for item in [topMarker, leftMarker, bottomMarker, rightMarker, centerMarker]{
        item.backgroundColor = markerColor
      }
      layer.borderColor = markerColor?.cgColor
    }
  }
  @IBInspectable
  var mainColor: UIColor?{
    didSet{
      self.backgroundColor = mainColor
    }
  }
  @IBInspectable
  var borderWigth: CGFloat = 0{
    didSet{
      layer.borderWidth = borderWigth
    }
  }
  
  // MARK: - arrows settings
  @IBInspectable 
  var hoursSize: CGFloat = 6
  @IBInspectable
  var hoursLength: CGFloat = 50
  @IBInspectable
  var hoursColor: UIColor?{
    didSet{
      hoursArrow.layer.backgroundColor = hoursColor?.cgColor
    }
  }
  @IBInspectable
  var minutesSize: CGFloat = 4
  @IBInspectable
  var minutesLength: CGFloat = 70
  @IBInspectable
  var minutesColor: UIColor?{
    didSet{
      minutesArrow.layer.backgroundColor = minutesColor?.cgColor
    }
  }
  @IBInspectable
  var secondsSize: CGFloat =  2
  @IBInspectable
  var secondsLength: CGFloat = 90
  @IBInspectable
  var secondsColor: UIColor?{
    didSet{
      secondsArrow.layer.backgroundColor = secondsColor?.cgColor
    }
  }
  func lenght(_ arrowLength: CGFloat) -> CGFloat{
    return frame.size.height/2 * arrowLength/100
  }
  
  // MARK: - time settings
  @IBInspectable
  var hours: CGFloat = 0
  @IBInspectable
  var minutes: CGFloat = 0
  @IBInspectable
  var seconds: CGFloat = 0
  
  // MARK: - layout settings
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let w = frame.size.width
    let h = frame.size.height
    layer.cornerRadius = w/2
    
    topMarker.frame = CGRect(x: (w - markerSize)/2, y: 0, width: markerSize, height: markerLenght)
    leftMarker.frame = CGRect(x: 0, y: (h - markerSize)/2, width: markerLenght, height: markerSize)
    bottomMarker.frame = CGRect(x: (w - markerSize)/2, y: h - markerLenght, width: markerSize, height: markerLenght)
    rightMarker.frame = CGRect(x: w - markerLenght, y: (h - markerSize)/2, width: markerLenght, height:  markerSize)
    centerMarker.frame = CGRect(x: (w - centralMarkerSize)/2, y: (h - centralMarkerSize)/2, width: centralMarkerSize, height: centralMarkerSize)
    centerMarker.layer.cornerRadius = centralMarkerSize/2
    
    hoursArrow.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    hoursArrow.frame = CGRect(x: (w - hoursSize)/2, y: h/2 - lenght(hoursLength), width: hoursSize, height: lenght(hoursLength))
    hoursArrow.backgroundColor = hoursColor
    
    minutesArrow.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    minutesArrow.frame = CGRect(x: (w - minutesSize)/2, y: h/2 - lenght(minutesLength), width: minutesSize, height: lenght(minutesLength))
    minutesArrow.backgroundColor = minutesColor
    
    secondsArrow.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    secondsArrow.frame = CGRect(x: (w - secondsSize)/2, y: h/2 - lenght(secondsLength), width: secondsSize, height: lenght(secondsLength))
    secondsArrow.backgroundColor = secondsColor
    
    updateTime()
    
    if isSetuped { return }
    isSetuped = true
    
    // MARK: - init views
    for item in [topMarker, leftMarker, bottomMarker, rightMarker, hoursArrow, minutesArrow, secondsArrow, centerMarker]{
      addSubview(item)
    }
  }
  
  func updateTime(){
    let hoursAngle = CGFloat.pi * 2 * (hours / CGFloat(12))
    hoursArrow.transform = CGAffineTransform(rotationAngle: hoursAngle)
    let minutesAngle = CGFloat.pi * 2 * (minutes / CGFloat(60))
    minutesArrow.transform = CGAffineTransform(rotationAngle: minutesAngle)
    let secondsAngle = CGFloat.pi * 2 * (seconds / CGFloat(60))
    secondsArrow.transform = CGAffineTransform(rotationAngle: secondsAngle)
  }
}
