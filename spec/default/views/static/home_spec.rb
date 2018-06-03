require_relative '../../../spec_helper'

describe Default::Views::Static::Home do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/default/templates/static/home.html.haml') }
  let(:view)      { Default::Views::Static::Home.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
