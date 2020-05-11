defmodule NewhorizonsapiWeb.SchemaTest do
  use NewhorizonsapiWeb.ConnCase
  alias Newhorizonsapi.Animals

  @user_query """
  query AllFish {
    all_fishes {
      name
    }
  }
  """
  @valid_attrs %{name: "Dace", price: 42, location: "Pond"}

  def fish_fixture(attrs \\ %{}) do
    {:ok, fish} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Animals.create_fish()

    fish
  end

  test "query: all_fishes", %{conn: conn} do
    fish_fixture()

    conn =
      post(conn, "/api", %{
        "query" => @user_query
      })

    assert json_response(conn, 200) == %{"data" => %{"all_fishes" => [%{"name" => "Dace"}]}}
  end
end
