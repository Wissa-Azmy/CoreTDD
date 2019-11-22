//
//  MovieManagerTests.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MoviesToSee_ReturnZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Add & Query
    func testAdd_MovieToSee_ReturnsOne() {
        let testMovie = Movie(title: "Sci-Fi")
        sut.add(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        let testMovie = Movie(title: "Arthouse Drama")
        sut.add(movie: testMovie)
        let movieQueried = sut.movie(atIndex: 0)
        
        XCTAssertEqual(movieQueried.title, testMovie.title)
    }
    
   

}
