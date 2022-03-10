defmodule Solution do
  def search(nums, target) do
    nums
    |> Enum.with_index()
    |> split()
    |> look_for(target)
  end

  defp look_for([[{l, i}],_], l), do: i
  defp look_for([_,[{r, i}]], r), do: i
  defp look_for([left, [{r, i}|_] = right], target) do
    cond do
      target < r -> left |> split() |> look_for(target)
      target > r -> right |> split() |> look_for(target)
      target == r -> i
    end
  end
  defp look_for(_, _), do: -1

  def split(list) do
    len =
      length(list)
      |> Kernel./(2)
      |> round()
    Enum.split(list, len)
    |> Tuple.to_list()
  end
end

# IO.inspect Solution.split([1])
# IO.inspect Solution.split([1, 2])
# IO.inspect Solution.split([1, 2, 3])
# IO.inspect Solution.split([1, 2, 3, 4])
:timer.tc(fn ->
  Solution.search([1, 2, 3], 3)
end) |> IO.inspect

:timer.tc(fn ->
  Solution.search([1, 2, 3, 4], 3)
end) |> IO.inspect

:timer.tc(fn ->
  Solution.search([1, 2, -3], 3)
end) |> IO.inspect

:timer.tc(fn ->
  Solution.search([-9, 1, 2, 3, 5, 10], -9)
end) |> IO.inspect
