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
  require ListNode

  @spec delete_duplicates(head :: ListNode.t | nil) :: ListNode.t | nil
  def delete_duplicates(head) do
    explore_and_prune(head, nil)
  end

  defp explore_and_prune(nil, _), do: nil
  defp explore_and_prune(%ListNode{val: val, next: next}, %ListNode{val: val} = previous) do
    explore_and_prune(next, previous)
  end
  defp explore_and_prune(%ListNode{next: next} = head, _previous) do
    %{head | next: explore_and_prune(next, head)}
  end
end

defmodule Test do
  require ListNode

  def simple() do
    %ListNode{val: 1, next: %ListNode{
      val: 1, next: %ListNode{
        val: 2, next: nil
      }
    }}
    |> Solution.delete_duplicates()
    |> IO.inspect()
  end

  def simple2() do
    %ListNode{val: 1, next: %ListNode{
      val: 1, next: %ListNode{
        val: 1, next: %ListNode{
          val: 2, next: %ListNode{
            val: 2, next: nil
          }
        }
      }
    }}
    |> Solution.delete_duplicates()
    |> IO.inspect()
  end
end

Test.simple()
Test.simple2()
