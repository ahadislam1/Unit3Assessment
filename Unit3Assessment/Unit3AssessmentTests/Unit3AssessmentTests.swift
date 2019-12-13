//
//  Unit3AssessmentTests.swift
//  Unit3AssessmentTests
//
//  Created by Ahad Islam on 12/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import XCTest
@testable import Unit3Assessment

class Unit3AssessmentTests: XCTestCase {

    func testGetJSON() {
        let endpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        let name = "Hydrogen"
        let exp = XCTestExpectation(description: "JSON decoded successfully")
        var elements = [Element]()
        
        GenericCoderService.manager.getJSON(objectType: [Element].self, with: endpointURL) { result in
            switch result {
            case .failure(let error):
                print("Error occured getting JSON \(error)")
            case .success(let elementsFromAPI):
                elements = elementsFromAPI
                XCTAssertEqual(elements[0].name, name)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 20.0)
    }
    

}
