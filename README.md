# Sequences

A solution to https://gist.github.com/pedromartinez/7788650

Given lines of words, `Sequence::Builder` will find all N-letter sequences that occur in only one input word, and lets you see the sequences and the word in which each one was found. The default sequence length is 4.

Finds only sequences of letters (`/[A-Za-z]/`) - excluding, for example, numbers, apostrophes, period and ampersands.

For executable documentation, run `rspec spec --format doc`.

## Usage from Ruby

Initialize `Sequence::Builder` with an `IO` object - for example, a `File`, a `StringIO`, or `STDIN`. Then call `#sequences` and/or `#words` to see the analyzed output.

For example, from `bin/console`:

```ruby
>> sb = Sequences::Builder.new(StringIO.new("arrows\ncarrots\ngive\nme"), 2)
=> #<Sequences::Builder:0x007f86f3ad0f58 @sequence_map={"ca"=>"carrots", "gi"=>"give", "iv"=>"give", "me"=>"me", "ot"=>"carrots", "ow"=>"arrows", "ts"=>"carrots", "ve"=>"give", "ws"=>"arrows"}>
>> sb.sequences
#=> ["carr", "give", "rots", "rows", "rrot", "rrow"]
>> sb.words
=> ["carrots", "give", "carrots", "arrows", "carrots", "arrows"]
```

You may optionally provide a sequence length.

```ruby
>> sb = Sequences::Builder.new(StringIO.new("arrows\ncarrots\ngive\nme"), 2)
#=> #<Sequences::Builder:0x007f86f3ad0f58 @sequence_map={"ca"=>"carrots", "gi"=>"give", "iv"=>"give", "me"=>"me", "ot"=>"carrots", "ow"=>"arrows", "ts"=>"carrots", "ve"=>"give", "ws"=>"arrows"}>
>> sb.sequences
=> ["ca", "gi", "iv", "me", "ot", "ow", "ts", "ve", "ws"]
>> sb.words
=> ["carrots", "give", "give", "me", "carrots", "arrows", "carrots", "give", "arrows"]
```

## Command-line Usage

To use as a script, pipe input to `bin/sequences`. For example:

`cat /usr/share/dict/words | bin/sequences`

You can set `OUTPUT_DIR` and `SEQUENCE_LENGTH` environment variables if you wish.
