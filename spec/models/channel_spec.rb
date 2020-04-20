require 'rails_helper'

RSpec.describe Channel do
  
  it 'makes an api call' do
    response = Channel.update_channel
    binding.pry
  end
  
end