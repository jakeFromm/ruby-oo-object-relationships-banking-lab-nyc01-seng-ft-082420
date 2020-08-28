require "pry"

require_relative "./lib/bank_account.rb"
require_relative "./lib/transfer.rb"

bryn = BankAccount.new("bryn")
jake = BankAccount.new("jake")

send_money = Transfer.new(jake, bryn, 500)

binding.pry