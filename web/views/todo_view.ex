defmodule EmberPhoenixScaffold.TodoView do
  use EmberPhoenixScaffold.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :is_completed]
end
