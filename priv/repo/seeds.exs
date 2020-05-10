# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Newhorizonsapi.Repo.insert!(%Newhorizonsapi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Newhorizonsapi.Animals.Fish
alias Newhorizonsapi.Repo

File.stream!("fish_export.csv")
|> Stream.drop(1)
|> CSV.decode(headers: [:name, :sell_value, :location])
|> Enum.each(fn {:ok, map} ->
  Fish.changeset(
    %Fish{},
    %{name: map[:name], price: String.to_integer(map[:sell_value]), location: map[:location]}
  )
  |> Repo.insert!()
end)
