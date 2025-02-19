//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let MyIconSize = CGSize(width: 58,height: 58)

UIGraphicsBeginImageContext(MyIconSize)

//// Color Declarations
//let MyLightGrayColor = UIColor(red: 0.250, green: 0.250, blue: 0.250, alpha: 1.000)
let MyWhiteColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

//// Group
//// svg_1
//// Bezier Drawing
let MyApplePath = UIBezierPath()
MyApplePath.moveToPoint(CGPointMake(1, 1))
MyApplePath.addLineToPoint(CGPointMake(50, 1))
MyApplePath.addLineToPoint(CGPointMake(50, 50))
MyApplePath.addLineToPoint(CGPointMake(1, 50))
MyApplePath.addLineToPoint(CGPointMake(1, 1))
MyApplePath.closePath()


MyWhiteColor.setFill()
MyApplePath.fill()
MyWhiteColor.setStroke()
MyApplePath.stroke()

let MyAppleImage = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()



let MyFinalImage = MyAppleImage
