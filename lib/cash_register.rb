class CashRegister

    attr_accessor :total
    attr_reader :discount, :items, :costs, :quantities

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @costs = []
        @quantities = []
    end

    def add_item(item, cost, quantity = 1)
        self.total += cost*quantity
        quantity.times{ 
            self.items << item
            self.costs << cost
        }
        self.quantities << quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total *= (1 - (self.discount.to_f/100))
            "After the discount, the total comes to $#{self.total.round}."
        end
    end

    def void_last_transaction
        if quantities.size != 0
            self.quantities.last.times do 
                self.items.pop
               self.total -= self.costs.last
               self.costs.pop
            end 
            self.quantities.pop
        end
    end
end
