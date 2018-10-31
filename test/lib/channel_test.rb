require 'test_helper'

describe Channel do

  it "raises an error if both name and id are not passed in" do
    expect {
      Channel.new
    }.must_raise ArgumentError

    expect {
      Channel.new("foo")
    }.must_raise ArgumentError
  end

  it "assigns a name and an ID at initialization" do
    channel = Channel.new('some name', 'some id')
    expect(channel.name).wont_be_nil
    expect(channel.name).must_equal 'some name'

    expect(channel.id).wont_be_nil
    expect(channel.id).must_equal 'some id'
  end

  it "raises an error if name or id are empty strings" do

    empty_string = ''
    valid_input = 1

    expect {
      Channel.new(empty_string, valid_input)
    }.must_raise ArgumentError

    expect {
      Channel.new(valid_input, empty_string)
    }.must_raise ArgumentError

    expect {
      Channel.new(empty_string, empty_string)
    }.must_raise ArgumentError

  end

end
