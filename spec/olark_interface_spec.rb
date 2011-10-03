require './lib/olark_interface'
require 'spec_helper'

def mock_env(stubs={})
  @mock_env ||= mock(ENV, stubs).as_null_object 
end

describe OlarkInterface do
  it "should get a jid and a password from environment variables" do
    olark = OlarkInterface.new
    olark.jid.should == "" #mock_env['OLARK_ID']
    olark.password.should == "" #mock_env['OLARK_PASSWORD']
  end

  it "should connect to oLark via xmpp4r with the login credentials"

  it "should listen for messages from oLark" 

  it "should place messages from oLark onto a Starling chat message queue"

  it "should monitor Starling chat message queue for replies to messages"

  it "should send replies to messages to the user for whom the message was created"
end
