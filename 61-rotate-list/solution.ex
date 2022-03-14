# Definition for singly-linked list.
#
defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec rotate_right(head :: ListNode.t | nil, k :: integer) :: ListNode.t | nil
  def rotate_right(head, k) do
    Functions.rotate(head, k)
  end
end

defmodule Functions do
  require ListNode

  def get_length(nil), do: 0
  def get_length(%ListNode{} = head) do
    1 + get_length(head.next)
  end

  def take(head, amount, current \\ 1)
  def take(nil, _, _), do: nil
  def take(head, val, val), do: %ListNode{ head | next: nil}
  def take(%ListNode{next: next} = head, amount, current) do
    %ListNode{head | next: take(next, amount, current + 1)}
  end

  def at(head, target_index, current_index \\ 0)
  def at(nil, _, _), do: nil
  def at(head, idx, idx), do: head
  def at(%ListNode{next: next} = head, target_index, current_index) do
    at(next, target_index, current_index + 1)
  end

  def rotate(head, k)
  def rotate(nil, k), do: nil
  def rotate(%ListNode{} = head, k) do
    length = get_length(head)

    if k == length do
      head
    else
      k = if k > length, do: rem(k, length), else: k

      a = at(head, length - k)
      b = take(head, length - k)
      concat(a, b)
    end
  end

  def concat(head, tail)
  def concat(nil, tail), do: tail
  def concat(%ListNode{next: next} = head, tail) do
    %{head | next: concat(next, tail)}
  end
end

defmodule Test do
  def assert(v, v) do
    IO.puts "#{v}: true"
  end

  def assert(received, expected) do
    raise "#{expected}: false, got #{received}"
  end
end

defmodule Data do
  def three_items do
    %ListNode{
      val: 0, next: %ListNode{
        val: 1, next: %ListNode{
          val: 2, next: nil
        }
      }
    }
  end

  def five_items do
    %ListNode{
      val: 1, next: %ListNode{
        val: 2, next: %ListNode{
          val: 3, next: %ListNode{
            val: 4, next: %ListNode{
              val: 5, next: nil
            }
          }
        }
      }
    }
  end
end

defmodule Assertions do
  require ListNode
  require Data
  require Test

  def run do
    get_length()
    take()
    at()
    rotate()
  end

  defp get_length do
    Data.three_items()
    |> Functions.get_length()
    |> Test.assert(3)
  end

  defp take do
    Data.three_items()
    |> Functions.take(1)
    |> IO.inspect()
    |> Functions.get_length()
    |> Test.assert(1)

    Data.three_items()
    |> Functions.take(2)
    |> IO.inspect()
    |> Functions.get_length()
    |> Test.assert(2)
  end

  def at do
    Data.three_items()
    |> Functions.at(1)
    |> IO.inspect()
    |> Functions.get_length()
    |> Test.assert(2)

    Data.three_items()
    |> Functions.at(2)
    |> IO.inspect()
    |> Functions.get_length()
    |> Test.assert(1)
  end

  def rotate do
    Data.three_items()
    |> Functions.rotate(1)
    |> IO.inspect()

    Data.three_items()
    |> Functions.rotate(2)
    |> IO.inspect()

    Data.three_items()
    |> Functions.rotate(3)
    |> IO.inspect()

    Data.three_items()
    |> Functions.rotate(4)
    |> IO.inspect()

    Data.five_items()
    |> Functions.rotate(2)
    |> IO.inspect()
  end
end

Assertions.run()
