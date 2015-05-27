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
    var itemIndex = 1
    
    override func setUp() {
        super.setUp()
        gildedRose = GildedRose()
    }
    
    func testSellInDecreasesEachDay() {
        let expectedSellIn = 1
        gildedRose.updateQuality()
        let newSellIn = gildedRose.items[itemIndex].sellIn

        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }
    
    func testIncreasesInQualityOverTime() {
        let expectedQuality = 1
        gildedRose.updateQuality()
        let newQuality = gildedRose.items[itemIndex].quality
        XCTAssertEqual(newQuality, expectedQuality, "Cheese should increase in quality over time")
    }
    
    func testQualityIsNeverGreaterThan50() {
        for _ in (1...55) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality

        XCTAssertEqual(newQuality, 50, "quality should never be greater than 50")
    }
}
