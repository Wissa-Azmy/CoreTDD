//
//  LibraryViewControllerTest.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/23/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class LibraryViewControllerTest: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "LibraryViewController") as? LibraryViewController
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }

    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MoviesLibraryDataService)
    }
    
    // MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MoviesLibraryDataService)
    }
    
    // MARK: - DataService avoid future changes
    func testDataService_IsLibraryTableViewDelegateAndDataSource() {
        XCTAssertEqual(sut.libraryTableView.delegate as! MoviesLibraryDataService, sut.libraryTableView.dataSource as! MoviesLibraryDataService)
    }
}
