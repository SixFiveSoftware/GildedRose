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
    var item: Item!
    
    override func setUp() {
        super.setUp()
        item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
        items = [item]
    }
    
    override func tearDown() {
        super.tearDown()
        resetItems()
    }

    func testSellInNeverChanges() {
        let expectedSellIn = item.sellIn
        gildedRose.updateQuality()
        let newSellIn = item.sellIn
        
        XCTAssertEqual(newSellIn, expectedSellIn, "sellIn should not change")
    }
    
    func testQualityNeverChanges() {
        let expectedQuality = item.quality
        gildedRose.updateQuality()
        let newQuality = item.quality
        XCTAssertEqual(newQuality, expectedQuality, "quality should not change")
    }
    
}
