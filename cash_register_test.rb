# cash_register_test.rb

require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10) # 10 is item_cost
    @register = CashRegister.new(100)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    @register.accept_money(@transaction)
    assert_equal(120, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 20
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    receipt = "You've paid #{@transaction.item_cost}.\n"
    assert_output(receipt) { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new('20\n')
    capture_io { @transaction.prompt_for_payment(input: input) }
    assert_equal(20, @transaction.amount_paid)
  end


end

p CashRegister.class
