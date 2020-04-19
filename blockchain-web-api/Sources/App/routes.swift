import Vapor
import BlockchainCore

extension Block: Content {}
extension Transaction: Content {}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let bchController = BlockchainController()
    router.get("/", use: bchController.getBlockchain)
    router.post(Transaction.self, at: "mine", use: bchController.postMine)
    router.get("hello", use: bchController.greet)

    //    router.get { req in
//        return "It works!"
//    }
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
}
