require "sequences/version"

module Sequences

  class Builder
    def initialize(io) # file or stringIO, read lazily?
      @sequence_map = {}
      io.each_line do |word|
        word.strip!
        word.chars.each_cons(4).map(&:join).each do |sequence|
          if @sequence_map.key?(sequence)
            @sequence_map[sequence] = :multiple
          else
            @sequence_map[sequence] = word
          end
        end
      end

      @sequence_map.reject! { |_, value| value == :multiple }
      @sequence_map = @sequence_map.sort.to_h
    end

    def sequences
      @sequence_map.keys
    end

    def words
      @sequence_map.values
    end

  end

end
