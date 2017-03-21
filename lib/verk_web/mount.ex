defmodule VerkWeb.Mount do
  @mount_path Application.get_env(:verk_web, VerkWeb.Endpoint) |> Keyword.get(:path, "/") |> String.trim

  def mount_path do
    impl_get_mount_path(@mount_path)
  end

  defmacro __using__(_opts \\ []) do
    quote do
      path = unquote(mount_path())
      plug VerkWeb.Plug.Mount, path
      socket "#{path}/socket", VerkWeb.UserSocket
    end
  end

  defp impl_get_mount_path("/") do
    ""
  end

  defp impl_get_mount_path(path) do
    if String.starts_with?(path, "/") do
      path
    else
      "/" <> path
    end
  end
end
