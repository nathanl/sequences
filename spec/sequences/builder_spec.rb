require 'spec_helper'
require 'stringio'

describe Sequences::Builder do

  let(:builder) { described_class.new(dictionary) }

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

    it "finds all sequences that occur once, in alphabetical order" do
      expect(builder.sequences).to eq(
        %w[carr give rots rows rrot rrow]
      )
    end

    it "excludes sequences that occur multiple times" do
      expect(builder.sequences.include?("arro")).to eq(false)
    end

    it "finds their matching words" do
      expect(builder.words).to eq(
        %w[carrots give carrots arrows carrots arrows]
      )
    end

  end

  describe "with words that contain non-letters" do

    let(:dictionary) {
      StringIO.new("can't\ngive\n10th\nPB&J\n".strip)
    }

    it "only finds sequences of letters" do
      expect(builder.sequences).to eq(
        %w[give]
      )
    end

    it "finds their matching words" do
      expect(builder.words).to eq(
        %w[give]
      )
    end

  end

  describe "with words that are too short" do

    let(:dictionary) {
      StringIO.new("hi\nmy\nold\nshoe".strip)
    }

    it "only finds sequences from words that are long enough" do
      expect(builder.sequences).to eq(
        %w[shoe]
      )
    end

    it "finds their matching words" do
      expect(builder.words).to eq(
        %w[shoe]
      )
    end

  end

  describe "when given a different sequence length" do

    let(:dictionary) {
      StringIO.new("hi\nmy\nold\nhiking\nshoe".strip)
    }

    let(:builder) { described_class.new(dictionary, 2) }

    it "finds sequences of the given length" do
      expect(builder.sequences).to eq(
        %w[ho ik in ki ld my ng oe ol sh]
      )
    end

    it "finds their matching words" do
      expect(builder.words).to eq(
        %w[shoe hiking hiking hiking old my hiking shoe old shoe]
      )
    end

  end

end
