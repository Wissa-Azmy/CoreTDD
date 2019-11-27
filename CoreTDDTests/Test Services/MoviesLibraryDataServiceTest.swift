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
        let tableViewMoc = TableViewMock()
        tableViewMoc.dataSource = sut
        tableViewMoc.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        sut.movieManager?.add(movie: fairyTail)
        tableViewMoc.reloadData()
        _ = tableViewMoc.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMoc.cellDequeuedProperly)
    }
}

extension MoviesLibraryDataServiceTest {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
