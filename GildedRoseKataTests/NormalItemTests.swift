//
//  TestNormalItem.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/15/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//

// - Once the sell by date has passed, Quality degrades twice as fast
// - The Quality of an item is never negative

import UIKit
import XCTest

class TestNormalItem: XCTestCase {

    var gildedRose = GildedRose()
    var itemIndex = 0
    
    override func setUp() {
        super.setUp()
        gildedRose = GildedRose()
    }
    
    func testOneDay() {
        
        gildedRose.updateQuality()
        let expectedQuality = 19
        let expectedSellIn = 9

        let newQuality = gildedRose.items[itemIndex].quality
        let newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }

    func testQualityDegradesTwiceAsFastAfterSellIn() {
        let expectedQuality = 8
        let expectedSellIn = -1
        for _ in (1...11) {
            gildedRose.updateQuality()
        }
        let newQuality = gildedRose.items[itemIndex].quality
        let newSellIn = gildedRose.items[itemIndex].sellIn

        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by two after sellIn days")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should be -1")
    }

    func testQualityIsNeverNegative() {
        for _ in (1...25) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, 0, "quality should never be less than 0")
    }    
}
