require './lib/olark_interface'
require 'spec_helper'
require 'xmpp4r'

describe OlarkInterface do
  let(:olark) {OlarkInterface.new}

  it "should assign jid and a password from environment variables" do
    olark.jid.should == ENV['OLARK_ID']
    olark.password.should == ENV['OLARK_PASSWORD']
  end

  it "should assign an olark client to client" do
    olark.client.should be_kind_of(Jabber::Client)
  end

  it "should connect to oLark via xmpp4r with the login credentials" do
    olark.connect
    olark.should be_connected 
  end

  it "should listen for messages from oLark" 

  it "should place messages from oLark onto a Starling chat message queue"

  it "should monitor Starling chat message queue for replies to messages"

  it "should send replies to messages to the user for whom the message was created"
end
