//
//  MoviesLibraryDataServiceTest.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/25/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class MoviesLibraryDataServiceTest: XCTestCase {
    var sut: MoviesLibraryDataService!
    var libraryVC: LibraryViewController!
    var tableView: UITableView!
    var mockTable = TableViewMock()
    
    let fairyTail = Movie(title: "Fairy Tail")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MoviesLibraryDataService()
        sut.movieManager = MovieManager()
        libraryVC = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "LibraryViewController"
        ) as? LibraryViewController
        _ = libraryVC.view
        
        mockTable = TableViewMock.initMockTable(dataSource: sut)
        tableView = libraryVC.libraryTableView
        
        tableView.dataSource = sut
        tableView.delegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testTableViewSections_CountReturnsZero() {
        XCTAssertEqual(tableView.numberOfSections, 2)
    }
    
    func testTableView_SectionOne_MoviesToSeeCount() {
        sut.movieManager?.add(movie: fairyTail)
        sut.movieManager?.add(movie: thriller)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.add(movie: darkComedy)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableView_SectionTwo_MoviesSeenCount() {
        sut.movieManager?.add(movie: fairyTail)
        sut.movieManager?.add(movie: darkComedy)
        sut.movieManager?.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.movieManager?.checkOffMovie(atIndex: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: - Cells
    func testCell_RowAtIndex_IsMovieCell() {
        sut.movieManager?.add(movie: fairyTail)
        tableView.reloadData()
        
        let queriedCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(queriedCell is MovieCell)
    }

    func testCell_ShouldDequeueCell() {
        sut.movieManager?.add(movie: fairyTail)
        mockTable.reloadData()
        _ = mockTable.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTable.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.add(movie: fairyTail)
        mockTable.reloadData()
        let cell = mockTable.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTail)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.add(movie: fairyTail)
        sut.movieManager?.add(movie: darkComedy)
        sut.movieManager?.checkOffMovie(atIndex: 0)
        mockTable.reloadData()
        let cell = mockTable.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTail)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.add(movie: fairyTail)
        sut.movieManager?.add(movie: darkComedy)
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
}

