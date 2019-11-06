require 'asciidoctor-tabbed-code'

describe Asciidoctor::Tabbed::Code do
  it "broccoli is gross" do
    expect(Foodie::Food.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(Foodie::Food.portray("Not Broccoli")).to eql("Delicious!")
  end
end