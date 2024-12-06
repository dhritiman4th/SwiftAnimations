//
//  ViewController.swift
//  CustomAnimations
//
//  Created by Dhritiman Saha on 06/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addHeartView()
    }

    func addHeartView() {
        let heartView = HeartView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        heartView.center = view.center
        view.addSubview(heartView)
    }

}

