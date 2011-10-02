#http://www.rubyfleebie.com/xmpp4r-a-real-world-example/
require 'xmpp4r'
require 'xmpp4r/roster'
class Fleebie
  include Jabber
  attr_accessor :jid, :password
  attr_reader :client, :roster
 
  def initialize
    self.jid = ENV['JID'] 
    self.password = ENV['JPASSWORD']
    @client = Client.new(self.jid)
    Jabber::debug = true
    connect
  end
 
  def connect
    @client.connect
    @client.auth(@password)
    @client.send(Presence.new.set_type(:available))
 
    #the "roster" is our bot contact list
    @roster = Roster::Helper.new(@client)
 
    #...to do something with the messages we receive
    start_message_callback
  end
 
  private
 
  #Whatever we receive, we send it to our "backend" message queue. It's
  #not our job to parse and decode the actual message
  def start_message_callback
    @client.add_message_callback do |m|
      puts ({:from => m.from, :body => m.body}) unless m.composing? || m.body.to_s.strip == ""
      #@starling.set('backend',{:from => m.from, :body => m.body}.to_json)
      #  unless m.composing? || m.body.to_s.strip == ""
    end
  end
end
 
Fleebie.new
Thread.stop
