//
//  TestConjuredItem.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/15/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//
//- "Conjured" items degrade in Quality twice as fast as normal items

import UIKit
import XCTest

class TestConjuredItem: XCTestCase {
    
    var gildedRose = GildedRose()
    var itemIndex = 5
    
    override func setUp() {
        super.setUp()
        gildedRose = GildedRose()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gildedRose = GildedRose()
        super.tearDown()
    }

    func testOneDay() {
        var expectedQuality = gildedRose.items[itemIndex].quality
        var expectedSellIn = gildedRose.items[itemIndex].sellIn
        gildedRose.updateQuality()
        expectedSellIn--
        expectedQuality -= 2
        var newQuality = gildedRose.items[itemIndex].quality
        var newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }

    func testTwoDays() {
        var oldQuality = gildedRose.items[itemIndex].quality
        var oldSellIn = gildedRose.items[itemIndex].sellIn
        gildedRose.updateQuality()
        gildedRose.updateQuality()
        var newQuality = gildedRose.items[itemIndex].quality
        var newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, oldQuality - 4, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, oldSellIn - 2, "sellIn should decrease by one each day")
    }

    
    func testQualityDegradesTwiceAsFastAfterSellIn() {
        var oldQuality = gildedRose.items[itemIndex].quality
        var oldSellIn = gildedRose.items[itemIndex].sellIn
        for _ in (1...4) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        var newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, oldQuality - 6 - 2, "quality should decrease by two after sellIn days")
        XCTAssertEqual(newSellIn, oldSellIn - 11, "sellIn should be -1")
    }
    
    func testQualityIsNeverNegative() {
        for _ in (1...25) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, 0, "quality should decrease by two after sellIn days")
    }
}