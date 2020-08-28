
require "pry"
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction #This is still failing the specs and I have no idea why! The error message says it's returning nil but in pry tests it was working as specified. 
    if valid? && receiver.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif !self.sender.valid? || sender.balance < amount
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
end