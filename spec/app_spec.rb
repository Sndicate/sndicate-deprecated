require 'spec_helper'
require "#{SndRoot}/core/controllers/application_controller"

describe ApplicationController do
  it 'should respond to a default path' do
    get '/'
    last_response.should be_ok
  end
end
