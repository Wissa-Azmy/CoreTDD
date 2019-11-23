//
//  MovieStructTests.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class MovieStructTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_MovieWithTitleAndReleaseDate() {
        let testMovie = Movie(title: "Captin America", releaseDate: "2011")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "2011")
    }
    
    // MARK: - Equatable
    func testEquatable_EqualMoviesTitles() {
        let movie1 = Movie(title: "Wissa")
        let movie2 = Movie(title: "Wissa")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_NotEqualMoviesTitles() {
        let movie1 = Movie(title: "Wissa")
        let movie2 = Movie(title: "Michael")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_EqualReleaseDates() {
        let movie1 = Movie(title: "Wissa", releaseDate: "2000")
        let movie2 = Movie(title: "Wissa", releaseDate: "2019")
        
        XCTAssertNotEqual(movie1, movie2)
    }

}
