# Ruby hand of cards /w tests

class Card 

  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

end

class HandOfCards 
  
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  # def check_for_pair 
  #   @hand.each do |card1|
  #     @hand.each do |card2|
  #       if card1.value == card2.value and card1 != card2
  #         return true
  #       end
  #     end
  #   end
  #   return false
  # end

  def check_for_pair 
    hash = {}
    @hand.each do |card1|
      if hash[card1.value] 
        return true
      else
        hash[card1.value] = 1
      end 
    end
    return false
  end

  def check_for_straight
    sorted_hand = @hand.sort { |x, y| x.value <=> y.value}
    sorted_hand.each_index do |index|
      if index + 1 == sorted_hand.length
        return true
      elsif sorted_hand[index].value + 1 != sorted_hand[index + 1].value 
        return false
      end
    end
  end

  def check_for_flush
    suit = @hand[0].suit
    @hand.each do |card|
      if card.suit != suit
        return false
      end
    end
    return true
  end

end




describe Card do 
  let(:card1) {Card.new(1, 10)}

  it 'can initiate' do
    expect(card1).to be_a Card
  end

  it 'has a suit' do
    expect(card1.suit).to eq(1)
  end

  it 'has a value' do
    expect(card1.value).to eq(10)
  end
end

describe HandOfCards do 
  let(:card1) {Card.new(1, 1)}
  let(:card2) {Card.new(4, 2)}
  let(:card3) {Card.new(2, 3)}
  let(:card4) {Card.new(1, 4)}
  let(:card5) {Card.new(3, 1)}
  let(:card6) {Card.new(2, 6)}
  let(:card7) {Card.new(2, 5)}
  let(:card8) {Card.new(2, 10)}
  let(:card9) {Card.new(2, 1)}
  let(:hand1) {HandOfCards.new([card1, card2, card3, card4, card5])}
  let(:hand2) {HandOfCards.new([card1, card2, card3, card4, card6])}
  let(:hand3) {HandOfCards.new([card1, card2, card3, card4, card7])}
  let(:hand4) {HandOfCards.new([card3, card6, card7, card8, card9])}

  it 'can initiate' do
    expect(hand1).to be_a HandOfCards
  end

  it 'has a hand instance variable that\'s an array' do 
    expect(hand1.hand).to eq([card1, card2, card3, card4, card5])
  end 

  it 'has a hand instance variable with a length of 5' do
    expect(hand1.hand.length).to eq(5)
  end

  describe '#check_for_pair' do

    it 'should return true for a hand with two cards with the same value' do
      expect(hand1.check_for_pair).to eq(true)
    end

    it 'should return false for a hand that don\'t have two cards with the same value' do
      expect(hand2.check_for_pair).to eq(false)
    end
  end

  describe '#check_for_straight' do

    it 'should return true for a hand with a straight' do
      expect(hand3.check_for_straight).to eq(true)
    end

    it 'should return false for a hand without a straight' do
      expect(hand1.check_for_straight).to eq(false)
    end
  end

  describe '#check_for_flush' do

    it 'should return true for a hand with a flush' do
      expect(hand4.check_for_flush).to eq(true)
    end

    it 'should return false for a hand without a flush' do
      expect(hand1.check_for_flush).to eq(false)
    end

  end
end
















