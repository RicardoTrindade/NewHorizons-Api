defmodule NewhorizonsapiWeb.FishResolver do
  alias Newhorizonsapi.Animals

  def all_fishes(_root, _args, _info) do
    fishes = Animals.list_fishes()
    {:ok, fishes}
  end

  def fish_search(_root, %{name: name}, _info) do
    fish = Animals.get_fish_by_name(name)
    {:ok, fish}
  end

  def fish_by_value(_root, %{price: price}, _info) do
    fishes = Animals.get_fish_over_price(price)
    {:ok, fishes}
  end
end
