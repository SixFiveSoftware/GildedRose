//
//  GildedRoseKataTests.swift
//  GildedRoseKataTests
//
//  Created by Hank Turowski on 5/12/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//

import UIKit
import XCTest

class GildedRoseKataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
        ]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
}
