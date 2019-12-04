//
//  MovieCellTests.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 12/3/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class MovieCellTests: XCTestCase {

    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let libraryVC = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "LibraryViewController"
        ) as? LibraryViewController
        _ = libraryVC?.view
        
        tableView = libraryVC?.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellConfig_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configCell(movie: Movie(title: "The last king", releaseDate: "2016"))
        
        XCTAssertEqual(cell.textLabel?.text, "The last king")
        XCTAssertEqual(cell.detailTextLabel?.text, "2016")
    }

}
