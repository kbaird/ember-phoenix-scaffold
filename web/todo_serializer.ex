defmodule EmberPhoenixScaffold.ArticleSerializer do
  use JaSerializer

  location "/todos/:id"
  attributes [:title, :is_completed]

end
