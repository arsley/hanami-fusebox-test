require_relative '../../../spec_helper'

describe Default::Controllers::Static::Home do
  let(:action) { Default::Controllers::Static::Home.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
