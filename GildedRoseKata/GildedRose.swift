//
//  UpdateQuality.swift
//  GildedRoseKata
//
//  Created by Hank Turowski on 5/12/15.
//  Copyright (c) 2015 Turowski. All rights reserved.
//

import Foundation

class Item
{
    var name: String
    var sellIn: Int
    var quality: Int
    
    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

var items = [
    Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
    Item(name: "Aged Brie", sellIn: 2, quality: 0),
    Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
    Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
    Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
    Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
]

class GildedRose {
    
    func updateQuality() {
        for(var i = 0; i < items.count; i++ ) {
            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert")
            {
                if (items[i].quality > 0)
                {
                    if (items[i].name != "Sulfuras, Hand of Ragnaros")
                    {
                        items[i].quality = items[i].quality - 1
                    }
                }
            }
            else
            {
                if (items[i].quality < 50)
                {
                    items[i].quality = items[i].quality + 1
                    
                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert")
                    {
                        if (items[i].sellIn < 11)
                        {
                            if (items[i].quality < 50)
                            {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                        if (items[i].sellIn < 6)
                        {
                            if (items[i].quality < 50)
                            {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }
            
            if (items[i].name != "Sulfuras, Hand of Ragnaros")
            {
                items[i].sellIn = items[i].sellIn - 1
            }
            
            if (items[i].sellIn < 0)
            {
                if (items[i].name != "Aged Brie")
                {
                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert")
                    {
                        if (items[i].quality > 0)
                        {
                            if (items[i].name != "Sulfuras, Hand of Ragnaros")
                            {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    }
                    else
                    {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                }
                else
                {
                    if (items[i].quality < 50)
                    {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
        }
    }
}