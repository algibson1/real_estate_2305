require "./lib/room"
require "./lib/house"

RSpec.describe House do
    describe "Iteration 2" do
        before do
            @house = House.new("$400000", "123 sugar lane")
            @room_1 = Room.new(:bedroom, 10, '13')
            @room_2 = Room.new(:bedroom, 11, '15')
        end
    
        it 'exists' do
            expect(@house).to be_a(House)
        end

        it 'has a price' do
            expect(@house.price).to eq(400000)
        end

        it 'has an address' do
            expect(@house.address).to eq("123 sugar lane")
        end

        it 'has no rooms by default' do
            expect(@house.rooms).to eq([])
        end

        it 'can add rooms' do
            @house.add_room(@room_1)
            @house.add_room(@room_2)
            expect(@house.rooms).to eq([@room_1, @room_2])
        end
    end

    describe "Iteration 3" do
        before do
            @house = House.new("$400000", "123 sugar lane")
            @room_1 = Room.new(:bedroom, 10, '13')
            @room_2 = Room.new(:bedroom, 11, '15')
            @room_3 = Room.new(:living_room, 25, '15')
            @room_4 = Room.new(:basement, 30, '41')
            @house.add_room(@room_1)
            @house.add_room(@room_2) 
            @house.add_room(@room_3)
            @house.add_room(@room_4)
        end

        it 'is above market average if over $500000' do
            expect(@house.price).to eq(400000)
            expect(@house.above_market_average?).to be false
            house2 = House.new("$500000", "456 glucose boulevard")
            expect(house2.above_market_average?).to be false
            house3 = House.new("$500001", "789 strawberry fields")
            expect(house3.above_market_average?).to be true
        end

        it 'can list rooms by category' do
            expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
            expect(@house.rooms_from_category(:basement)).to eq([@room_4])
            expect(@house.rooms_from_category(:living_room)).to eq([@room_3])
        end

        it 'can calculate area' do
            expect(@house.area).to eq(1900)
            room_5 = Room.new(:bathroom, 10, '7')
            @house.add_room(room_5)
            expect(@house.area).to eq(1970)
        end

        it 'can return details' do
            expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
        end
    end

    describe "Iteration 4" do
        before do
            @house = House.new("$400000", "123 sugar lane")
            @room_1 = Room.new(:bedroom, 10, '13')
            @room_2 = Room.new(:bedroom, 11, '15')
            @room_3 = Room.new(:living_room, 25, '15')
            @room_4 = Room.new(:basement, 30, '41')
            @house.add_room(@room_4)
            @house.add_room(@room_1)
            @house.add_room(@room_3)
            @house.add_room(@room_2) 
        end

        it 'can calculate price per square foot' do
            expect(@house.price_per_square_foot).to eq(210.53)
        end

        it 'can sort rooms by area' do
            expect(@house.rooms_sorted_by_area).to eq([@room_4, @room_3, @room_2, @room_1])
        end

        it 'can list all rooms by category' do
            expect(@house.rooms_by_category).to eq({:bedroom=>[@room_1, @room_2], :living_room=> [@room_3], :basement=> [@room_4]}
        end
    end
end