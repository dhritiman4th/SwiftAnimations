//
//  HeartView.swift
//  TestApp
//
//  Created by Dhritiman Saha on 05/12/24.
//


import UIKit

class HeartView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareHeartMask()
        startAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareHeartMask()
        startAnimation()
    }
    
    func prepareHeartMask() {
        let height = bounds.height
        let width = bounds.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.5, y: height * 0.125))
        path.addCurve(to: CGPoint(x: width * 0.125, y: height * 0.125),
                      controlPoint1: CGPoint(x: width * 0.375, y: 0),
                      controlPoint2: CGPoint(x: width * 0.25, y: 0))
        path.addCurve(to: CGPoint(x: width * 0.125, y: height * 0.5),
                      controlPoint1: CGPoint(x: 0, y: height * 0.25),
                      controlPoint2: CGPoint(x: 0, y: height * 0.375))
        path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.9))
        path.addLine(to: CGPoint(x: width * 0.875, y: height * 0.5))
        path.addCurve(to: CGPoint(x: width * 0.875, y: height * 0.125),
                      controlPoint1: CGPoint(x: width, y: height * 0.375),
                      controlPoint2: CGPoint(x: width, y: height * 0.25))
        path.addCurve(to: CGPoint(x: width * 0.5, y: height * 0.125),
                      controlPoint1: CGPoint(x: width * 0.75, y: 0),
                      controlPoint2: CGPoint(x: width * 0.625, y: 0))
        path.close()
        
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillColor = UIColor.red.cgColor
        maskLayer.frame = bounds
        maskLayer.backgroundColor = UIColor.clear.cgColor
        layer.addSublayer(maskLayer)
        
        layer.masksToBounds = false
        layer.shadowColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.white.cgColor : UIColor.black.cgColor
        layer.shadowOffset = CGSizeZero
        layer.shadowOpacity = 0.5
        layer.shadowPath = path.cgPath
        layer.shadowRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareHeartMask()
    }
    
    func startAnimation() {
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(animateHeart),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func animateHeart() {
        UIView.animate(springDuration: 0.35,
                       bounce: 0.5,
                       initialSpringVelocity: 0.5,
                       delay: 0.0,
                       options: .curveEaseInOut) {
            let scaleTransform2 = CGAffineTransform(scaleX: 1.5,
                                                    y: 1.5)
            self.transform = scaleTransform2
        }
        UIView.animate(springDuration: 0.35,
                       bounce: 0.5,
                       initialSpringVelocity: 0.5,
                       delay: 0.35,
                       options: .curveEaseInOut) {
            let scaleTransform2 = CGAffineTransform(scaleX: 2.0,
                                                    y: 2.0)
            self.transform = scaleTransform2
        }
        UIView.animate(springDuration: 0.4,
                       bounce: 0.5,
                       initialSpringVelocity: 0.5,
                       delay: 0.2,
                       options: .curveEaseInOut) {
            let scaleTransform2 = CGAffineTransform(scaleX: 1.0,
                                                    y: 1.0)
            self.transform = scaleTransform2
        }
    }
    
    
}


