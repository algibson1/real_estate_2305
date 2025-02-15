class House
    attr_reader :price, :address, :rooms
    def initialize(price, address)
        @price = price.delete("$").to_i
        @address = address
        @rooms = []
    end

    def add_room(room)
        @rooms << room
    end

    def above_market_average?
        @price > 500000
    end

    def rooms_from_category(category)
        @rooms.find_all {|room| room.category == category}
    end

    def area
        total = 0
        @rooms.each {|room| total += room.area}
        total
    end

    def details
        {"price" => @price, "address" => @address}
    end

    def price_per_square_foot
        (@price.to_f/area).round(2)
    end

    def rooms_sorted_by_area
        @rooms.sort_by {|room| room.area}.reverse
    end

    def rooms_by_category
        @rooms.group_by {|room| room.category}
    end
end