import Kitura
import Cocoa
import Foundation

let router = Router()

router.all("/ClaimService/add", middleware: BodyParser())

router.get("/"){
    request, response, next in
    response.send ("Hello, Welcome to our Claim server")
}

router.post("ClaimService/add"){
    request, response , next in
    let body = request.body
    let jObj = body?.asJSON
    if let jDict = jObj as? [String:String]{
        if let t = jDict["title"], let d = jDict["date"]{
            let cObj = Claim( t: t, d: d)
            ClaimDao().addClaim(cObj: cObj)
        }
        response.send ("The Claim record was succesfully inserted (via POST Method)")
    }
    else {response.send ("The Claim record was failure inserted (via POST Method)")}
    next()
}

router.get("ClaimService/getAll"){
    request , response, next in
    let cList = ClaimDao().getAll()
    let jsonData: Data = try JSONEncoder().encode(cList)
    let jsonStr = String (data:jsonData, encoding: .utf8)
    response.status(.OK)
    response.headers["Content-Type"] = "application/json"
    response.send(jsonStr)
    next()
}

Kitura.addHTTPServer(onPort:8020, with:router)
Kitura.run()
