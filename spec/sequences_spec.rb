require 'spec_helper'
require 'stringio'

describe Sequences do

  let(:builder) { Sequences::Builder.new(dictionary) }

  describe "with an empty dictionary" do

    let(:dictionary) { StringIO.new }

    it "finds no sequences" do
      expect(builder.sequences).to eq([])
    end

    it "finds no words" do
      expect(builder.words).to eq([])
    end

  end

  describe "with a tiny dictionary of letter-only words" do

    let(:dictionary) {
      StringIO.new("arrows\ncarrots\ngive\nme".strip)
    }

    it "finds the expected sequences" do
      expect(builder.sequences).to eq(
        %w[carr give rots rows rrot rrow]
      )
    end

    it "finds the expected words" do
      expect(builder.words).to eq(
        %w[carrots give carrots arrows carrots arrows]
      )
    end

  end

  describe "it only produces sequences of letters A-z" do

    let(:dictionary) {
      StringIO.new("10th\ngive".strip)
    }

    it "finds the expected sequences" do
      expect(builder.sequences).to eq(
        %w[give]
      )
    end

    it "finds the expected words" do
      expect(builder.words).to eq(
        %w[give]
      )
    end

  end

end
