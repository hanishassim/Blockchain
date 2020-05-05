//
//  BlockchainController.swift
//  App
//
//  Created by Hanis Hassim on 19/04/2020.
//

import Foundation
import Vapor
import BlockchainCore

class BlockchainController {
    private (set) var blockchainService: BlockchainService
    
    init() {
        blockchainService = BlockchainService()
    }
    
    func getBlockchain(request: Request) -> Future<String> {
        Future.map(on: request) { () -> String in
            return self.blockchainService.getBlockchain().print.description
        }
    }
    
    func postMine(request: Request, transaction: Transaction) -> Block {
        return blockchainService.getNextBlock(transactions: [transaction])
    }
    
    func registerNodes(request: Request, nodes: [BlockchainNode]) -> [BlockchainNode] {
        return blockchainService.registerNodes(nodes: nodes)
    }
    
    func getNodes(request: Request) -> [BlockchainNode] {
        return  blockchainService.getNodes()
    }
    
    func greet(request: Request) -> Future<String> {
        Future.map(on: request) { () -> String in
            return "Welcome to Blockchain"
        }
    }
}
