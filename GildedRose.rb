# frozen_string_literal: true

require_relative './Items'

class GildedRose
  def initialize(items)
    @items = items
    review_data
  end

  def review_data
    @items.each do |item|
      item.sell_in = 0 if item.sell_in.negative?
      item.quality = 50 if item.quality > 50
    end
  end

  def quality(item)
    if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
      item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hagit clone nd of Ragnaros')
    elsif item.quality < 50
      item.quality = item.quality + 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality + 1 if item.sell_in < 11 && (item.quality < 50)
        item.quality = item.quality + 1 if item.sell_in < 6 && (item.quality < 50)
      end
    end
  end

  def sell_in(item)
    item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    if item.sell_in.negative?
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')
        else
          item.quality = item.quality - item.quality
        end
      elsif item.quality < 50
        item.quality = item.quality + 1
      end
    end
  end

  def update_quality
    @items.each do |item|
      quality(item)
      sell_in(item)
    end
  end

  def imprimir_datos
    @items.each do |item|
      puts "Nombre: #{item.name} Fecha para venta: #{item.sell_in} Calidad:#{item.quality}"
    end
    puts ' '
  end
end
