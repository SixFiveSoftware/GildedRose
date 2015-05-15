//
//  TestTicketItem.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/15/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//
// - "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

import UIKit
import XCTest

class TestTicketItem: XCTestCase {
    var gildedRose = GildedRose()
    var itemIndex = 4
    
    override func setUp() {
        super.setUp()
        gildedRose = GildedRose()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSellInDecreasesEachDay() {
        var expectedSellIn = gildedRose.items[itemIndex].sellIn
        gildedRose.updateQuality()
        expectedSellIn--
        var newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }
    
    func testIncreasesInQualityByOneWithMoreThanTenDays() {
        var expectedQuality = gildedRose.items[itemIndex].quality
        gildedRose.updateQuality()
        expectedQuality++
        gildedRose.updateQuality()
        expectedQuality++
        var newQuality = gildedRose.items[itemIndex].quality
        XCTAssertEqual(newQuality, expectedQuality, "Cheese should increase in quality over time")
    }

    func testIncreasesInQualityByTwoWithTenToSix() {
        var expectedQuality = gildedRose.items[itemIndex].quality
        while(gildedRose.items[itemIndex].sellIn > 9) {
            expectedQuality++
            if gildedRose.items[itemIndex].sellIn <= 10 {
                expectedQuality++
            }
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, expectedQuality , "Cheese should increase in quality over time")
    }

    func testIncreasesInQualityByThreeWithFiveToZero() {
        var expectedQuality = gildedRose.items[itemIndex].quality
        while(gildedRose.items[itemIndex].sellIn > 3) {
            expectedQuality++
            if gildedRose.items[itemIndex].sellIn <= 10 {
                expectedQuality++
            }
            if gildedRose.items[itemIndex].sellIn <= 5 {
                expectedQuality++
            }
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, expectedQuality , "Cheese should increase in quality over time")
    }

    func testQualityIsZeroAfterSellIn() {
        for _ in (1...55) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, 0, "quality should be zero after sellInDays")
    }
}
