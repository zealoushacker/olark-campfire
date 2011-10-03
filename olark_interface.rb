class OlarkInterface
  attr_accessor :jid, :password

  def initialize
    self.jid = ENV['OLARK_ID']
    self.password = ENV['OLARK_PASSWORD']
  end
end
