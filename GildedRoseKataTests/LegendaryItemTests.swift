//
//  testLegendaryItem.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/15/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//
// - "Sulfuras", being a legendary item, never has to be sold or decreases in Quality

import UIKit
import XCTest

class TestLegendaryItem: XCTestCase {
    var gildedRose = GildedRose()
    var itemIndex = 3
    
    override func setUp() {
        super.setUp()
        gildedRose = GildedRose()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSellInNeverChanges() {
        var expectedSellIn = gildedRose.items[itemIndex].sellIn
        gildedRose.updateQuality()
        var newSellIn = gildedRose.items[itemIndex].sellIn
        
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should not change")
    }
    
    func testQualityNeverChanges() {
        var expectedQuality = gildedRose.items[itemIndex].quality
        gildedRose.updateQuality()
        var newQuality = gildedRose.items[itemIndex].quality
        XCTAssertEqual(newQuality, expectedQuality, "quality should not change")
    }
    
}
