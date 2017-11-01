#!/usr/bin/env ruby

# The MenuItem class represents a single item on a menu - some sort
# of dish or drink.

class MenuItem
  attr_reader :title, :price

  COL_WIDTH = 30

  def initialize(title, price)
    @title = title
    @price = price
  end

  def tagline(length)
    raise "title and price too long" if content_longer_than? length
    "#{title} #{tagline_fill(length)} #{pretty_price}"
  end

  private

  def pretty_price
    "£#{'%.02f' % price}"
  end

  def tagline_fill(length, char = '.')
    ''.ljust(length - content_length, char)
  end

  def content_length
    title.length + pretty_price.length + 2 # for spacing
  end

  def content_longer_than?(length)
    content_length > length
  end
end
