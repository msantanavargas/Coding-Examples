//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var MyMoonAge = Int()

let MyIconSize = NSSize(width: 50, height: 50)
let MyMoonImage = NSImage(size: MyIconSize)


MyMoonAge = 5


let MyMoonPath1 = NSBezierPath()
MyMoonPath1.lineWidth = 2.0

let MyMoonSize = NSSize(width: 40, height: 40)
let MyMoonOrigin = NSPoint(x:(MyMoonImage.size.width - MyMoonSize.width) / 2, y:(MyMoonImage.size.height - MyMoonSize.height) / 2)

MyMoonImage.lockFocus()
NSColor.whiteColor().setStroke()
let MyMoonFrameRect = NSRect(x: MyMoonOrigin.x, y: MyMoonOrigin.y, width: MyMoonSize.width, height: MyMoonSize.height)
let MyMoonFramePath = NSBezierPath(ovalInRect: MyMoonFrameRect)
MyMoonFramePath.lineWidth = 2.0
MyMoonFramePath.stroke()
MyMoonImage.unlockFocus()

switch MyMoonAge {
    
case 1,2,29,30,31: // New Moon
    MyMoonImage.lockFocus()
    //NSColor.blackColor().setStroke()
    NSColor.whiteColor().setStroke()
    let MyFrameRect = NSRect(x: MyMoonOrigin.x, y: MyMoonOrigin.y, width: MyMoonSize.width, height: MyMoonSize.height)
    let MyNewMoonPath = NSBezierPath(ovalInRect: MyFrameRect)
    MyNewMoonPath.lineWidth = 2.0
    MyNewMoonPath.stroke()
    MyMoonImage.unlockFocus()
    
case 14,15:  // Full Moon
    MyMoonImage.lockFocus()
    NSColor.whiteColor().setStroke()
    NSColor.whiteColor().setFill()
    let MyFrameRect = NSRect(x: MyMoonOrigin.x, y: MyMoonOrigin.y, width: MyMoonSize.width, height: MyMoonSize.height)
    let MyFullMoonPath = NSBezierPath(ovalInRect: MyFrameRect)
    MyFullMoonPath.lineWidth = 2.0
    MyFullMoonPath.stroke()
    MyFullMoonPath.fill()
    MyMoonImage.unlockFocus()

default:
    
    
    let MoonCycle = 29.5 as CGFloat       //Complete Moon Cycle is 29.5
    let HalfMoonCycle = (MoonCycle / 2.0) // + 3.25  // 3.25 to account for 6.5 days of new moons and full moons per cycle that don't need to be drawn this way??
    let StartCycle1 = 3 as CGFloat
    let EndCycle1 = 14 as CGFloat
    let StartCycle2 = 16
    let EndCycle2 = 28
    
    
    MyMoonImage.lockFocus()
    NSColor.whiteColor().setStroke()
    
    MyMoonPath1.moveToPoint(NSPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/, y:MyMoonOrigin.y /*+ 1*/)) // P(25,5)
    
    /*Left Half*/
    let c = CGFloat(MyMoonSize.width + MyMoonOrigin.x /*- 1*/) //Size of Moon + Origin - 1 so that the circle drawn is not cut off outside of the ImageView if the MoonSize = ImageViewSize i.e. both 50 points
    //let a = max((MyMoonOrigin.x), (c * (1 - (CGFloat(MyMoonAge) / (HalfMoonCycle + 3.25)))) )     // (left hemicircle (45,1)) --> 
    
                                                                                                                                //Age of Moon is 3 (a=45) to 14 (a=1)
    // 3.25 to account for 6.5 days of new moons and full moons per cycle that don't need to be drawn this way??
    let a = max((MyMoonOrigin.x), (c * (1 - ( (CGFloat(MyMoonAge) - StartCycle1) / (EndCycle1 )  ))  ))
    
    MyMoonPath1.curveToPoint(NSPoint(x:a,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y), controlPoint1: NSPoint(x:a,y:CGFloat(MyMoonOrigin.y /*+ 1*/)), controlPoint2: NSPoint(x:a,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y))
    MyMoonPath1.curveToPoint(NSPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/, y:MyMoonSize.height + MyMoonOrigin.y /*- 1*/), controlPoint1: NSPoint(x:a,y:MyMoonSize.height + MyMoonOrigin.y /*- 1*/), controlPoint2: NSPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/,y:MyMoonSize.height + MyMoonOrigin.y /*- 1*/))
    
    /*Right Half*/
    let b = c * (  ( MoonCycle - max(HalfMoonCycle, CGFloat(MyMoonAge))  ) / (HalfMoonCycle))  // (right hemicircle (1,45))  -->
    
                                                                                                                                //Age of Moon is 16 (b=45) to 28 (b=1)
    // 1.0 to account for 6.5 days of new moons and full moons per cycle that don't need to be drawn this way??
    
    
    print(b)
    
    MyMoonPath1.curveToPoint(NSPoint(x:b,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y), controlPoint1: NSPoint(x:b,y:CGFloat(MyMoonOrigin.y + MyMoonSize.height /*+ 1*/)), controlPoint2: NSPoint(x:b,y:CGFloat(MyMoonSize.height / 2) + MyMoonOrigin.y))
    MyMoonPath1.curveToPoint(NSPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/, y:MyMoonOrigin.y /*- 1*/), controlPoint1: NSPoint(x:b,y:MyMoonOrigin.y /*- 1*/), controlPoint2: NSPoint(x:(MyMoonSize.width / 2) + MyMoonOrigin.x /*+ 1*/,y:MyMoonOrigin.y /*- 1*/))
    
    /*MyMoonPath1.curveToPoint(NSPoint(x:b,y:25), controlPoint1: NSPoint(x:b,y:1), controlPoint2: NSPoint(x:b,y:25))
    MyMoonPath1.curveToPoint(NSPoint(x:26,y:49), controlPoint1: NSPoint(x:b,y:49), controlPoint2: NSPoint(x:26,y:49))*/
    
    MyMoonPath1.stroke()
    
    NSColor.whiteColor().setFill()
    MyMoonPath1.fill()
    MyMoonImage.unlockFocus()
    
}

MyMoonImage



