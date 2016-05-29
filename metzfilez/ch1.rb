class Gear

  attr_reader :cog, :chainring, :rim, :tire 
  
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def ratio 
    chainring/cog.to_f
  end

  def gear_inches
    ratio * (rim + (tire * 2))
  end

end


describe "Gear" do
  describe "#ratio" do
    let(:gear1) { Gear.new(52, 11, 26, 1.5) }
    let(:gear2) { Gear.new(30, 27, 26, 1.5) }
    it 'calculates the correct ratio' do
      expect(gear1.ratio).to eq(4.7272727272727275)
    end  
    it 'calculates the correct ratio' do
      expect(gear2.ratio).to eq(1.1111111111111112)
    end
  end
  describe "#gear_inches" do 
    let(:gear1) { Gear.new(52, 11, 26, 1.5)}
    let(:gear2) { Gear.new(52, 11, 24, 1.25)}
    it 'calculates the correct gear inches' do 
      expect(gear1.gear_inches).to eq(137.0909090909091)
    end
    it 'calculates the correct gear inches' do 
      expect(gear2.gear_inches).to eq(125.27272727272728)
    end

  end
end


























