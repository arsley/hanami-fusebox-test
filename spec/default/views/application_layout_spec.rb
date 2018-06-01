require "spec_helper"

describe Default::Views::ApplicationLayout do
  let(:layout)   { Default::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/default/templates/application.html.haml') }

  it 'contains application name' do
    rendered.must_include('Default')
  end
end
