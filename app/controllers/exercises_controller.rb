class ExercisesController < ApplicationController
  def exercise1
    @foods = Food.left_outer_joins(:order_foods).where(order_foods: { id: nil })
  end

  def exercise2
    @shops = Shop.left_outer_joins(foods: :order_foods).distinct.where(foods: { order_foods: { id: nil } })
  end

  def exercise3 
    @address = Address.joins(:orders).select("addresses.*, count(orders.*) as orders_count").group("addresses.id").order("orders_count DESC").first
  end

  def exercise4 
    @customer = Customer.joins(orders: :foods).select("customers.*, sum(foods.price) as foods_price_sum").group("customers.id").order("foods_price_sum DESC").first
  end
end