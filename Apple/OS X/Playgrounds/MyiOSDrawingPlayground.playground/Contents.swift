//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let MyIconSize = CGSize(width: 50, height: 50)
var MySunImage = UIImage()
var MyCloudImage = UIImage()
var MyCloudImage2 = UIImage()
var MyRainImage = UIImage()
var MySnowImage = UIImage()

var MyCloudMaskImage = UIImage()
var MyCloudMaskImage2 = UIImage()
var MyFogImage = UIImage()
var MyMoonImage = UIImage()

/* Draw Sun */
//let MySunSize = NSSize(width: 28, height: 28)
var MyFrameRect = CGRectMake(11, 11, 28, 28)
let MyPath = UIBezierPath(ovalInRect: MyFrameRect)
let MySunColor = UIColor(red: 1.0, green: 0.75, blue: 0.0, alpha: 1.0)
let MySunColor2 = UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 0.25)


UIGraphicsBeginImageContext(MyIconSize)




//MySunImage.lockFocus()
//NSColor.headerColor().setFill()
//MyPath.fill()

MySunColor.setStroke()
MySunColor2.setFill()
//MyPath.lineWidth = 2.0
MyPath.stroke()
MyPath.fill()
//MySunImage.unlockFocus()

MySunImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

MySunImage




var MyMoonAge = Int()
MyMoonAge = 7
/***** NIGHT *****/
/* Draw Moon */

/* Age of Moon: (1,28)
1 -- New Moon
14.75 -- Full Moon
29.5 -- New Moon
Moon grows from right to left
*/

let MyDarkMoonColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.25)
let MyDarkMoonColor2 = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)

let MyMoonPath1 = UIBezierPath()
MyMoonPath1.lineWidth = 2.0

let MyMoonSize = CGSize(width: 40, height: 40)
let MyMoonOrigin = CGPoint(x:(MyIconSize.width - MyMoonSize.width) / 2, y:(MyIconSize.height - MyMoonSize.height) / 2)
//MyMoonOrigin = (5,5)

//MyMoonImage.lockFocus()
UIGraphicsBeginImageContext(MyIconSize)
//UIColor.whiteColor().setStroke()
MyDarkMoonColor2.setStroke()
MyDarkMoonColor.setFill()
let MyMoonFrameRect = CGRectMake( MyMoonOrigin.x,  MyMoonOrigin.y, MyMoonSize.width, MyMoonSize.height)
let MyMoonFramePath = UIBezierPath(ovalInRect: MyMoonFrameRect)
//MyMoonFramePath.lineWidth = 2.0
MyMoonFramePath.stroke()
MyMoonFramePath.fill()
//MyMoonImage.unlockFocus()
MyMoonImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()


switch MyMoonAge {
    
case 0,1,2,29,30,31: // New Moon
    //MyMoonImage.lockFocus()
    UIGraphicsBeginImageContext(MyIconSize)
    //UIColor.blackColor().setStroke()
    UIColor.whiteColor().setStroke()
    let MyFrameRect = CGRectMake( MyMoonOrigin.x,  MyMoonOrigin.y,  MyMoonSize.width,  MyMoonSize.height)
    let MyNewMoonPath = UIBezierPath(ovalInRect: MyFrameRect)
    //MyNewMoonPath.lineWidth = 1.0
    MyNewMoonPath.stroke()
    //MyMoonImage.unlockFocus()
    MyMoonImage    = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
case 14,15:  // Full Moon
    //MyMoonImage.lockFocus()
    UIGraphicsBeginImageContext(MyIconSize)
    UIColor.whiteColor().setStroke()
    UIColor.whiteColor().setFill()
    let MyFrameRect = CGRectMake( MyMoonOrigin.x,  MyMoonOrigin.y,  MyMoonSize.width,  MyMoonSize.height)
    let MyFullMoonPath = UIBezierPath(ovalInRect: MyFrameRect)
    //MyFullMoonPath.lineWidth = 2.0
    MyFullMoonPath.stroke()
    MyFullMoonPath.fill()
    //MyMoonImage.unlockFocus()
    MyMoonImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
default:
    
    
    
    let MoonCycle = 29.5 as CGFloat       //Complete Moon Cycle is 29.5
    let HalfMoonCycle = (MoonCycle / 2.0) // + 3.25  // 3.25 to account for 6.5 days of new moons and full moons per cycle that don't need to be drawn this way??
    let StartCycle1 = 3 as CGFloat
    let EndCycle1 = 14 as CGFloat
    //let StartCycle2 = 16 as CGFloat
    //let EndCycle2 = 28 as CGFloat
    
    
    //MyMoonImage.lockFocus()
    UIGraphicsBeginImageContext(MyIconSize)
    UIColor.whiteColor().setStroke()
    
    MyMoonPath1.moveToPoint(CGPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/, y:MyMoonOrigin.y /*+ 1*/)) // P(25,5)
    
    /*************/
    /* Left Half */
    /*************/
    
    
    let c = CGFloat(MyMoonSize.width + MyMoonOrigin.x)
    
    let a = max((MyMoonOrigin.x), (c * (1 - ( (CGFloat(MyMoonAge) - StartCycle1) / (EndCycle1 - StartCycle1 )  ))  ))
    // a is the position in the x coordinate of the left hemicircle edge
    // a=x=5 at full moon, a=x=45 at new moon
    // a ->    [5,45]
    // Age of Moon is 3 (a=45) to 14 (a=5)
    
    //print(a)
    
    MyMoonPath1.addCurveToPoint(CGPoint(x:a,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y), controlPoint1: CGPoint(x:a,y:CGFloat(MyMoonOrigin.y)), controlPoint2: CGPoint(x:a,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y))
    MyMoonPath1.addCurveToPoint(CGPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x, y:MyMoonSize.height + MyMoonOrigin.y), controlPoint1: CGPoint(x:a,y:MyMoonSize.height + MyMoonOrigin.y), controlPoint2: CGPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x,y:MyMoonSize.height + MyMoonOrigin.y))
    
    /**************/
     /* Right Half */
     /**************/
    
    
    let b = c * (( MoonCycle - max(HalfMoonCycle, CGFloat(MyMoonAge))) / (HalfMoonCycle))
    // b is the position in the x coordinate of the right hemicircle edge
    // b=x=5 at new moon, b=x=45 at full moon
    // b ->    [5,45]
    // Age of Moon is 14 (b=45) to 28 (b=5)
    
    //print(b)
    
    MyMoonPath1.addCurveToPoint(CGPoint(x:b,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y), controlPoint1: CGPoint(x:b,y:CGFloat(MyMoonOrigin.y + MyMoonSize.height)), controlPoint2: CGPoint(x:b,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y))
    MyMoonPath1.addCurveToPoint(CGPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x, y:MyMoonOrigin.y), controlPoint1: CGPoint(x:b,y:MyMoonOrigin.y), controlPoint2: CGPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x,y:MyMoonOrigin.y))
    
    /*MyMoonPath1.addCurveToPoint(CGPoint(x:b,y:25), controlPoint1: CGPoint(x:b,y:1), controlPoint2: CGPoint(x:b,y:25))
    MyMoonPath1.addCurveToPoint(CGPoint(x:26,y:49), controlPoint1: CGPoint(x:b,y:49), controlPoint2: CGPoint(x:26,y:49))*/
    
    MyMoonPath1.stroke()
    
    UIColor.whiteColor().setFill()
    MyMoonPath1.fill()
    //MyMoonImage.unlockFocus()
    MyMoonImage    = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
}


MyMoonImage


