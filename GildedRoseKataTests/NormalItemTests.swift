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
    var item: Item!
    
    override func setUp() {
        super.setUp()
        item = Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)
        items = [item]
    }
    
    override func tearDown() {
        super.tearDown()
        resetItems()
    }
    
    func testOneDay() {
        gildedRose.updateQuality()
        let expectedQuality = 19
        let expectedSellIn = 9

        let newQuality = item.quality
        let newSellIn = item.sellIn
        
        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }

    func testQualityDegradesTwiceAsFastAfterSellIn() {
        let expectedQuality = 8
        let expectedSellIn = -1
        for _ in (1...11) {
            gildedRose.updateQuality()
        }
        let newQuality = item.quality
        let newSellIn = item.sellIn

        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by two after sellIn days")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should be -1")
    }

    func testQualityIsNeverNegative() {
        for _ in (1...25) {
            gildedRose.updateQuality()
        }
        let newQuality = item.quality
        
        XCTAssertEqual(newQuality, 0, "quality should never be less than 0")
    }    
}
