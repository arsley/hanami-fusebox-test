require "spec_helper"

describe React::Views::ApplicationLayout do
  let(:layout)   { React::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/react/templates/application.html.haml') }

  it 'contains application name' do
    rendered.must_include('React')
  end
end
