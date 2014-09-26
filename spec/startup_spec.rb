require 'spec_helper'

describe 'The startup environment' do
  it 'should have an environment set' do
    expect(ENV['RACK_ENV']).to eq('test')
  end
end
