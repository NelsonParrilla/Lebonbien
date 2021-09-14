//
//  LebonbienTests.swift
//  LebonbienTests
//
//  Created by nelson on 14/09/2021.
//

import XCTest
@testable import Lebonbien

class MainViewTests: XCTestCase {

    let serverAPIClientMock = ServerAPIClientMock()

    lazy var mainViewModel = MainViewModel(serverAPI: serverAPIClientMock)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        XCTAssertEqual(mainViewModel.categories[0], serverAPIClientMock.mockedCategories[0])
        XCTAssertEqual(mainViewModel.categories[1], serverAPIClientMock.mockedCategories[1])
        XCTAssertEqual(mainViewModel.items[0], serverAPIClientMock.mockedItems[1])
        XCTAssertEqual(mainViewModel.items[1], serverAPIClientMock.mockedItems[2])
        XCTAssertEqual(mainViewModel.items[2], serverAPIClientMock.mockedItems[0])
    }

    func testGetItemsForCategory() throws {
        // When
        let items = mainViewModel.getItemsForCategory(category: mainViewModel.categories[0])

        // Then
        XCTAssertEqual(items[0].title, serverAPIClientMock.mockedItems[1].title)
        XCTAssertEqual(items[1].title, serverAPIClientMock.mockedItems[0].title)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
