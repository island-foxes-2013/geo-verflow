require 'spec_helper'

describe Geotag do
  it { should validate_presence_of :city_name }
  it { should validate_uniqueness_of :city_name }

  let(:geotag) { create(:geotag) }
  let(:emptygeotag) { Geotag.new }

  context "should fail" do

    let(:geotag_dup) { Geotag.new(city_name: "San Francisco") }

    it "with duplicate city name" do 
      geotag.save
      expect(geotag_dup.save).to be false
    end

    it "without city" do
       expect(emptygeotag.save).to be false
    end

  end

  context "should save" do

    it "with city" do
      expect(geotag.save).to be true   
    end
  
  end

end
