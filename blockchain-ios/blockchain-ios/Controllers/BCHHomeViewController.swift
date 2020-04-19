//
//  BCHHomeViewController.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import UIKit
import BlockchainCore

class BCHHomeViewController: UIViewController {
    
    // MARK: - Properties -
    
    // MARK: Internal
    
    var rootView: BCHHomeView {
        return view as! BCHHomeView
    }
    
    // MARK: Private
    
    private enum textFields: String, CaseIterable {
        case to, from, amount
    }
    
    override func loadView() {
        super.loadView()
        
        view = BCHHomeView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupListeners()
        
        let initalBlock = Block()
        let blockchain = Blockchain(initialBlock: initalBlock)
        let transaction = Transaction(from: "John", to: "Dan", amount: 31, transactionType: .domestic)
        print("---------------------------------")
        let block = blockchain.getNextBlock(transactions: [transaction])
        
        blockchain.addBlock(block)
        
        let data = try! JSONEncoder().encode(blockchain)
        guard let prettyJSON = data.prettyJSON else { return }
        
        print(prettyJSON)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private func setupListeners() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
        rootView.tableView.register(BCHTextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension BCHHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFields.allCases.count
    }
}

extension BCHHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BCHTextFieldTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title = textFields.allCases[indexPath.row].rawValue.capitalized
        
        return cell
    }
}
