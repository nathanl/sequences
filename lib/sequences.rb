require "sequences/version"

module Sequences

  class Builder
    def initialize(io, sequence_length = 4)
      @sequence_map = {}
      # Loading one line at a time is slightly slower than .readlines, but uses less memory
      while word = io.gets do
        word.strip!
        word.chars.each_cons(sequence_length).map(&:join).each do |sequence|
          next unless sequence.match(/\A[A-Za-z]+\z/)
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
