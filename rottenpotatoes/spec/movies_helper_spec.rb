require 'rails_helper'

describe MoviesController do 
  describe "#oddness(count)" do 
    it "returns odd if count is odd" do 
      expect(subject.oddness(3)).to eq("odd")
    end
    it "returns even if count is even" do 
      expect(subject.oddness(4)).to eq("even")
    end 
  end 
end 