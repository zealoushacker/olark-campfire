require './lib/olark_interface'
require 'spec_helper'
require 'xmpp4r'

def mock_jabber_client(stubs={})
  @mock_jabber_client ||= mock(Jabber::Client, stubs)
end

describe @olarkInterface do
  before(:each) do
    Jabber::Client.stub(:new) { mock_jabber_client(connect: true, auth: "password", send: "presence") }
    @olark = OlarkInterface.new
  end

  it "should assign jid and a password from environment variables" do
    @olark.jid.should == ENV['OLARK_ID']
    @olark.password.should == ENV['OLARK_PASSWORD']
  end

  it "should assign an olark client to client" do
    @olark.client.should be mock_jabber_client
  end

  it "should connect to @olark via xmpp4r with the login credentials" do
    mock_jabber_client.stub(:is_connected?) {true}
    @olark.connect
    @olark.should be_connected 
  end

  it "should listen for messages from @olark" do
    @olark.should_receive(:start_message_callback) 
    @olark.connect
  end

  it "should place messages from @olark onto a Starling chat message queue" 

  it "should monitor Starling chat message queue for replies to messages"

  it "should send replies to messages to the user for whom the message was created"
end
