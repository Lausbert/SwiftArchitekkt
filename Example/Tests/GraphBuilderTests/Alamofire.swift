//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {
    
    func testAlamofireiOSGraph() {
        let url = getUrlForRessourceFile(withName: "Alamofire", pathExtension: "ast")
        let ast = try! String(contentsOf: url, encoding: String.Encoding.utf8)
        testGraphBuilderFor(ast: ast, expectedGraphString: "")
    }
    
}
