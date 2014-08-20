require "spec_helper"

describe CleanParams do
  before(:each) do
    CleanParams.configure do |config|
      config.params = {
        'key' => ['key', 'Key'],
        'token' => ['token', "Token"],
        'source' => ['source', 'Source'],
        'name' => ['name', 'Name', 'customer_name']
      }
    end
  end
  
  let(:hash) { {"key"=>"123", "Key" => "345", "keys" => "1,2,3", "token"=>"asd34dd", "nested"=>{"source"=>"clean_params", "name"=>"XYZ"}} }
  let(:res) { CleanParams.clean(hash) }
  
  it "should return the match correctly" do
    expect(res.token).to be == 'asd34dd'
  end

  it "should return the first match" do
    expect(res.key).to be == '123'
  end
  
  it "should return the nested param correctly" do
    expect(res.source).to be == 'clean_params'
  end
  
  it "should return nil for the no-match" do
    expect(res.sources).to be_nil
  end
  
  it "should return value if present for no rule" do
    expect(res.keys).to be == "1,2,3"
  end
  
  it "should return nil if not present for no rule" do
    expect(res.no_keys).to be_nil
  end
end