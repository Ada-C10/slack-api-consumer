require 'test_helper'

describe Channel do
  it 'will raise an ArgumentError if created with less than 2 params' do
     expect {
         Channel.new
    }.must_raise ArgumentError

    expect {
        Channel.new('nodes')
    }.must_raise ArgumentError
  end

  it 'can be created with a name and id' do
    myChannel = Channel.new('nodes', '12345')

    expect(myChannel.name).must_equal 'nodes'
    expect(myChannel.id).must_equal '12345'
  end

  it 'optional parameters get set properly' do
    myChannel = Channel.new('nodes', '12345',
      purpose: 'to rock', is_archived: true, 
      is_general: true, members: [])


    expect(myChannel.purpose).must_equal 'to rock'
    expect(myChannel.is_archived).must_equal true
    expect(myChannel.is_general).must_equal true
    expect(myChannel.members).must_equal []
  end
end