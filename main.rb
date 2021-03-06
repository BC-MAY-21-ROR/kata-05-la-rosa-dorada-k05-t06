# frozen_string_literal: true

require_relative './Items'
require_relative './GildedRose'

items = [
  Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
  Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
  Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
  Item.new(name = 'Sulfuras', sell_in = 0, quality = 80),
  Item.new(name = 'Sulfuras', sell_in = -1, quality = 80),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 30),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 10),
  Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 2, quality = 20),
  # This Conjured item does not work properly yet
  Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 78) # <-- :O
]

gilded = GildedRose.new(items)
2.times do 
  gilded.update_quality
  gilded.imprimir_datos
end
