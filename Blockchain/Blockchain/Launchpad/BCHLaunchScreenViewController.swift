//
//  ViewController.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import UIKit

class BCHLaunchScreenViewController: UIViewController {
    
    var rootView: BCHLaunchScreenView {
        return view as! BCHLaunchScreenView
    }
    
    override func loadView() {
        super.loadView()
        
        view = BCHLaunchScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToHome()
    }
    
    private func goToHome() {
//        let vc = BCHHomeViewController()
//        view.window?.rootViewController = vc
//        view.window?.makeKeyAndVisible()
        
        let initalBlock = Block()
        let blockchain = Blockchain(initialBlock: initalBlock)
        
        let transaction = Transaction(from: "John", to: "Dan", amount: 31)
        print("---------------------------------")
        let block = blockchain.getNextBlock(transactions: [transaction])
        
        blockchain.addBlock(block)
    }
}

