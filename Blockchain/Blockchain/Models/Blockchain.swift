//
//  Blockchain.swift
//  Blockchain
//
//  Created by Hanis Hassim on 18/04/2020.
//  Copyright © 2020 H. All rights reserved.
//

import Foundation

class Blockchain {
    private (set) var blocks = [Block]()
    
    init(initialBlock: Block) {
        addBlock(initialBlock)
    }
    
    func addBlock(_ block: Block) {
        if blocks.isEmpty {
            block.previousHash = "00000000"
            block.hash = generateHash(for: block)
        }
        
        blocks.append(block)
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = Block()
        transactions.forEach { transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = blocks.count
        block.previousHash = previousBlock.hash
        block.hash = generateHash(for: block)
        
        return block
    }
    
    private func getPreviousBlock() -> Block {
        return blocks[blocks.count - 1]
    }
    
    private func generateHash(for block: Block) -> String {
        let hash = block.key.sha1Hash
        print(hash)
        return hash
    }
}
