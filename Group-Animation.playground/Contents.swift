import UIKit
import XCPlayground

var position = CGFloat(-160.0)

func setupCircle(circle: UIView) {
    circle.alpha = 0.0
    circle.center = containerView.center
    circle.center.x = circle.center.x + position
    position = position + 60.0
    circle.layer.cornerRadius = 25.0
    
    let startingColor = UIColor(red: (23.0/255.0), green: (159.0/255.0), blue: (47.0/255.0), alpha: 1.0)
    circle.backgroundColor = startingColor
}

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))

let circleA = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
setupCircle(circle: circleA)

let circleB = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
setupCircle(circle: circleB)

let circleC = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
setupCircle(circle: circleC)

let circleD = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
setupCircle(circle: circleD)


containerView.addSubview(circleA)
containerView.addSubview(circleB)
containerView.addSubview(circleC)
containerView.addSubview(circleD)


func animate(view: UIView, delay: Double) {
    var triangleAnimationUp: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
    triangleAnimationUp.fromValue = 0.0
    triangleAnimationUp.toValue = 1.0
    triangleAnimationUp.beginTime = delay + 0.0
    triangleAnimationUp.duration = 2.0
    
    var triangleAnimationDown: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
    triangleAnimationDown.fromValue = 1.0
    triangleAnimationDown.toValue = 0.5
    triangleAnimationDown.beginTime = delay + 2.0
    triangleAnimationDown.duration = 2.0
    
    var triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
    triangleAnimationGroup.animations = [triangleAnimationUp, triangleAnimationDown]
    triangleAnimationGroup.duration = delay + 4.0
    triangleAnimationGroup.fillMode = kCAFillModeForwards
    
    view.layer.add(triangleAnimationGroup, forKey: nil)
}


animate(view: circleA, delay: 0)
animate(view: circleB, delay: 1.0)
animate(view: circleC, delay: 2.0)
animate(view: circleD, delay: 3.0)
XCPlaygroundPage.currentPage.liveView = containerView

