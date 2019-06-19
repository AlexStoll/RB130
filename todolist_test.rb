require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  # tests go here

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift) # tests return value
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done? # setup done here, but not after each assertion
    assert_equal(false, @list.done?)
    assert_equal(true, @list.mark_all_done.done?)
  end

  def test_TypeError_raised
    assert_raises(TypeError) { @list.add(5) }
    assert_raises('TypeError') { @list.add('hi') }
  end

  def test_shovel
    another_todo = Todo.new("Get laundry detergent")
    assert_equal(@todos << another_todo, @list << another_todo)
  end

  def test_add
    another_todo = Todo.new("Mow the lawn")
    assert_equal(@todos << another_todo, @list.add(another_todo))
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(10) }
  end

  def test_mark_done_at
    @list.mark_done_at(1)

    assert_raises(IndexError) { @list.mark_done_at(10)}
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    assert_raises(IndexError) { @list.mark_undone_at(10)}
    assert_equal(true, @todo1.done?)
    assert_equal(false,@todo2.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todos.all? { |todo| todo.done? })
  end

  def test_undone!
    @todo1.done!
    @todo1.undone!
    assert_equal(false, @todo1.done?)
  end

  def test_remove_at
    @list.remove_at(2)
    assert_raises(IndexError) { @list.remove_at(10)}
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(0)

    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!

    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_each
    output = []
    @list.each { |todo| output << todo }
    assert_equal([@todo1, @todo2, @todo3], output)
  end

  def test_each_2
    assert_equal(@list, @list.each {|x| nil})
  end

  def test_select
    new_list = @list.select {|item| item.done?}
    assert_equal([], new_list.to_a)
  end

  def test_mark_all_done
    assert_equal(@todos.each {|todo| todo.done!}, @list.mark_all_done.to_a)
  end

  def test_mark_all_undone
    @list.done!
    @list.mark_all_undone
    assert_equal(false, @list.done?)
  end

  def test_all_done
    @list.done!
    assert_equal(@todos, @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@todos, @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done('Buy milk')
    assert_equal(true, @todo1.done?)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
  end
end