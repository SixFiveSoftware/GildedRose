//
//  TestAgingItem.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/15/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//

// - "Aged Brie" actually increases in Quality the older it gets
// - The Quality of an item is never more than 50

import UIKit
import XCTest

class TestAgingItem: XCTestCase {
    var gildedRose = GildedRose()
    var item: Item!
    
    override func setUp() {
        super.setUp()
        item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        items = [item]
    }
    
    override func tearDown() {
        super.tearDown()
        resetItems()
    }
    
    func testSellInDecreasesEachDay() {
        let expectedSellIn = 1
        gildedRose.updateQuality()
        let newSellIn = item.sellIn

        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }
    
    func testIncreasesInQualityOverTime() {
        let expectedQuality = 1
        gildedRose.updateQuality()
        let newQuality = item.quality
        XCTAssertEqual(newQuality, expectedQuality, "Cheese should increase in quality over time")
    }
    
    func testQualityIsNeverGreaterThan50() {
        for _ in (1...55) {
            gildedRose.updateQuality()
        }
        var newQuality = item.quality

        XCTAssertEqual(newQuality, 50, "quality should never be greater than 50")
    }
}
