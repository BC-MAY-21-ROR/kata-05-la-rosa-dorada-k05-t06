# frozen_string_literal: true

require_relative './Items'
 # Esta clase es responsable de 
class GildedRose
  # Obtener un array de items para poder analizarlos
  def initialize(items)
    @items = items
    review_data
  end
  # #Modulo para verificar que no haya datos invalidos
  def review_data
    @items.each do |item|
      item.sell_in = 0 if item.sell_in.negative?
      item.quality = 50 if item.quality > 50
    end
  end
  # metodo para validar la calidad de cada item
  def quality(item)
    if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
      item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras')
    elsif item.quality < 50
      item.quality = item.quality + 1
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality + 1 if item.sell_in <= 10 && (item.quality < 50)
        item.quality = item.quality + 1 if item.sell_in <= 5 && (item.quality < 50)
      end
    end
  end
  # metodo para validad la fecha de venta de cada item
  def sell_in(item)
    item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras'
    if item.sell_in.negative?
      if item.name != 'Aged Brie'
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = item.quality - 1 if item.quality.positive? && item.name != 'Sulfuras'
        else
          item.quality = item.quality
        end
      elsif item.quality < 50
        item.quality = item.quality + 1
      end
    end
    item.quality = 0 if item.sell_in.zero? && item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  # metodo para obtener la nueva calidad y sell_in de cada producto
  def update_quality
    @items.each do |item|
      quality(item)
      sell_in(item)
    end
  end

  # metodo para imprimir los datos
  def imprimir_datos
    @items.each do |item|
      puts "Nombre: #{item.name} Fecha para venta: #{item.sell_in} Calidad:#{item.quality}"
    end
    puts ' '
  end
end
