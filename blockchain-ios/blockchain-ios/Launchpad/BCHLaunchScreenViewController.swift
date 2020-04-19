//
//  ViewController.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import UIKit

class BCHLaunchScreenViewController: UIViewController {
    
    // MARK: - Properties -
    
    // MARK: Internal
    
    var rootView: BCHLaunchScreenView {
        return view as! BCHLaunchScreenView
    }
    
    override func loadView() {
        super.loadView()
        
        view = BCHLaunchScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.goToHome()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private func goToHome() {
        let vc = BCHHomeViewController()
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
}

