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
    

    func testOneDay() {
        let expectedQuality = 0
        let expectedSellIn = 0
        
        gildedRose.updateQuality()

        let newQuality = gildedRose.items[itemIndex].quality
        let newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }

    func testTwoDays() {
        let expectedQuality = 0
        let expectedSellIn = 0
        
        gildedRose.updateQuality()
        gildedRose.updateQuality()
        
        let newQuality = gildedRose.items[itemIndex].quality
        let newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }

    
    func testQualityDegradesTwiceAsFastAfterSellIn() {
        let expectedQuality = 0
        let expectedSellIn = 0
        
        for _ in (1...4) {
            gildedRose.updateQuality()
        }

        let newQuality = gildedRose.items[itemIndex].quality
        let newSellIn = gildedRose.items[itemIndex].sellIn

        XCTAssertEqual(newQuality, expectedQuality, "quality should decrease by one each day")
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should decrease by one each day")
    }
    
    func testQualityIsNeverNegative() {
        for _ in (1...25) {
            gildedRose.updateQuality()
        }
        var newQuality = gildedRose.items[itemIndex].quality
        
        XCTAssertEqual(newQuality, 0, "quality should decrease by two after sellIn days")
    }
}
