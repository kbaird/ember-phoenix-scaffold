defmodule EmberPhoenixScaffold.TodoController do
  use EmberPhoenixScaffold.Web, :controller

  alias EmberPhoenixScaffold.Todo
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render(conn, "index.json-api", data: todos)
  end

  def create(conn, %{"data" => data = %{"type" => "todo", "attributes" => _todo_params}}) do
    changeset = Todo.changeset(%Todo{}, new_data(data))

    case Repo.insert(changeset) do
      {:ok, todo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", todo_path(conn, :show, todo))
        |> render("show.json-api", data: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json-api", data: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    render(conn, "show.json-api", data: todo)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "todo", "attributes" => _todo_params}}) do
    todo      = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo, new_data(data))

    case Repo.update(changeset) do
      {:ok, todo} ->
        render(conn, "show.json-api", data: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("errors.json-api", data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(todo)

    send_resp(conn, :no_content, "")
  end

  ### PRIVATE FUNCTIONS

  def new_data(data) do
    data |> Params.to_attributes
         |> snakeify_keys
  end

  defp snakeify_key(ky), do: String.replace(ky, "-", "_")

  defp snakeify_keys(%{} = attrs) do
    Map.to_list(attrs)
    |> Enum.map(fn({ky, vl}) -> {snakeify_key(ky), vl} end)
    |> Map.new
  end

end
