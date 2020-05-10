defmodule NewhorizonsapiWeb.Schema do
  use Absinthe.Schema

  alias NewhorizonsapiWeb.FishResolver

  object :fish do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :shadow, non_null(:integer)
    field :price, non_null(:integer)
  end

  query do
    @desc "Get all fishes"
    field :all_fishes, non_null(list_of(non_null(:fish))) do
      resolve(&FishResolver.all_fishes/3)
    end

    @desc "Find a fish by its name"
    field :fish_search, :fish do
      arg(:name, non_null(:string))

      resolve(&FishResolver.fish_search/3)
    end

    @desc "Get fishes over price"
    field :fish_price, non_null(list_of(non_null(:fish))) do
      arg(:price, non_null(:integer))

      resolve(&FishResolver.fish_by_value/3)
    end
  end
end
