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
end