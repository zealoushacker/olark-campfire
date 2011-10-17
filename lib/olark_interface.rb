require 'xmpp4r'
class OlarkInterface
  include Jabber
  attr_accessor :jid, :password
  attr_reader :client

  def initialize
    self.jid = ENV['OLARK_ID']
    self.password = ENV['OLARK_PASSWORD']
    @client = Client.new(self.jid)
  end

  def connect
    @client.connect
    @client.auth(@password)
    @client.send(Presence.new.set_type(:available))

    start_message_callback
  end

  def start_message_callback
  end

  def listen_for_messages
    @client.add_message_callback do |m|
    end
  end

  def connected?
    @client.is_connected?
  end
end
