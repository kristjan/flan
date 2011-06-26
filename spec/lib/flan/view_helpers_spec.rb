require 'spec_helper'

describe Flan::ViewHelpers do
  include Flan::ViewHelpers

  def content_tag(tag, content, options={})
    attrs = options.map{|k,v| %[#{k}="#{v}"]}.join(' ')
    ["<#{tag}#{' ' + attrs if attrs.any?}>", content, "</#{tag}>"].join("\n")
  end

  context "#flan_command" do
    it "generates the right GA command from a key" do
      flan_command(:flan_pageview).should == '_trackPageview'
    end

    it "yells if the input isn't a Flan key" do
      expect { flan_command(:notice) }.to raise_error(ArgumentError)
    end
  end

  context "#flan_js" do
    context "when there are no pageviews to track" do
      let(:flash) do
        {
          :notice => "Flan is delicious!",
        }
      end

      it "generates nothing" do
        flan_js.should be_empty
      end
    end

    context "when there are pageviews to track" do
      let(:flash) do
        {
          :notice => "Flan is delicious!",
          :flan_pageview => ["/flan/caramel", "flan/chocolate"],
        }
      end

      it "generates a script tag" do
        flan_js.should =~ %r{<script type="text/javascript">.*</script>}m
      end

      it "generates a push call for each page" do
        flan_js.should(
          include(%{_gaq.push(['_trackPageview', '/_virtual/flan/caramel']);}))
        flan_js.should(
          include(%{_gaq.push(['_trackPageview', '/_virtual/flan/chocolate']);}))
      end
    end
  end

  context "#flan_keys" do
    let(:flash) do
      {
        :notice => "Flan is delicious!",
        :flan_key_a => [],
        :flan_key_b => [],
      }
    end

    it "finds keys that start with flan_" do
      flan_keys.should =~ [:flan_key_a, :flan_key_b]
    end

    it "ignores keys that do not start with flan_" do
      flan_keys.should_not include(:notice)
    end
  end

  context "#flan_path" do
    it "prefixes a path with /_virtual" do
      flan_path('desserts/caramel').should == '/_virtual/desserts/caramel'
    end

    it "squishes duplicate slashes" do
      flan_path('/desserts/caramel').should == '/_virtual/desserts/caramel'
    end
  end
end
