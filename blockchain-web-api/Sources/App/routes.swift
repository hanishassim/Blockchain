import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let bchController = BlockchainController()
    router.get("/", use: bchController.greet)
    router.get("blockchain", use: bchController.getBlockchain)
//    router.get { req in
//        return "It works!"
//    }
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
}
