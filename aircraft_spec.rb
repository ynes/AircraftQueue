require_relative 'aircraft'

describe Aircraft do
  let(:aircraft) { Aircraft.new(type: "passenger", size: "large")}

  it 'has a type' do
    expect(aircraft.type).to eq "passenger"
  end

  it 'has a size' do
    expect(aircraft.size).to eq "large"
  end

  describe "#valid?" do
    let(:aircraft1) {Aircraft.new(type: "commercial", size: "medium")}
    let(:aircraft2) {Aircraft.new(type: "passenger", size: "medium")}
    let(:aircraft3) {Aircraft.new(type: "commercial", size: "large")}

    it "returns true when the parameters match with any valid size and type" do
      expect(aircraft.valid?).to be(true)
    end
    it "returns false when any parameter doesn't match with any valid sizes or types" do
      expect(aircraft1.valid?).to be(false)
      expect(aircraft2.valid?).to be(false)
      expect(aircraft3.valid?).to be(false)
    end
    it "adds error messages" do
      aircraft1.valid?
      expect(aircraft1.errors).to eq(["Invalid type commercial", "Invalid size medium"])
      aircraft2.valid?
      expect(aircraft2.errors).to eq(["Invalid size medium"])
      aircraft3.valid?
      expect(aircraft3.errors).to eq(["Invalid type commercial"])
    end
  end  
end

