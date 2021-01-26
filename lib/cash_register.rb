require "pry"
class CashRegister

    attr_accessor :total, :discount, :added_items, :last_item_price
    attr_reader 
    
    def initialize(discount=0)
        @total=0
        @discount=discount
        @added_items = []

    end

    def add_item(title, price, quantity=1)
        self.last_item_price = price*quantity
        while quantity>0
            self.added_items << title
            self.total += price
            quantity -= 1
        end 
        
    end

    def apply_discount
        self.total = @total - @total * discount/100
        if @discount>0
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @added_items
    end

    def void_last_transaction
        self.total = self.total - @last_item_price
    end
end