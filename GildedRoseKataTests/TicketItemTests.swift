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
    var item: Item!
    
    override func setUp() {
        super.setUp()
        item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)
        items = [item]
    }

    override func tearDown() {
        super.tearDown()
        resetItems()
    }

    func testSellInDecreasesEachDay() {
        let expectedSellIn = 14
        gildedRose.updateQuality()
        let newSellIn = item.sellIn
        
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }
    
    func testIncreasesInQualityByOneWithMoreThanTenDays() {
        let expectedQuality = 22
        gildedRose.updateQuality()
        gildedRose.updateQuality()
        let newQuality = item.quality
        XCTAssertEqual(newQuality, expectedQuality, "Cheese should increase in quality over time")
    }

    func testIncreasesInQualityByTwoWithTenToSix() {
        let expectedQuality = 27
        while(item.sellIn >= 10) {
            gildedRose.updateQuality()
        }
        let newQuality = item.quality
        
        XCTAssertEqual(newQuality, expectedQuality , "Cheese should increase in quality over time")
    }

    func testIncreasesInQualityByThreeWithFiveToZero() {
        let expectedQuality = 44
        while(item.sellIn >= 3) {
            gildedRose.updateQuality()
        }
        let newQuality = item.quality
        
        XCTAssertEqual(newQuality, expectedQuality , "Cheese should increase in quality over time")
    }

    func testQualityIsZeroAfterSellIn() {
        for _ in (1...55) {
            gildedRose.updateQuality()
        }
        var newQuality = item.quality
        
        XCTAssertEqual(newQuality, 0, "quality should be zero after sellInDays")
    }
}
