defmodule VerkWeb.Mount do
  @mount_path Application.get_env(:verk_web, VerkWeb.Endpoint) |> Keyword.get(:path, "/") |> String.trim

  def mount_path do
    path = @mount_path

    cond do
      path == "/" -> ""
      String.starts_with?(path, "/") -> path
      true -> "/" <> path
    end
  end

  defmacro __using__(_opts \\ []) do
    quote do
      path = unquote(mount_path())
      plug VerkWeb.Plug.Mount, path
      socket "#{path}/socket", VerkWeb.UserSocket
    end
  end
end
