defmodule UriDecoderPlug do
  @moduledoc """
  URI decode (percent unescape) incoming requests paths.
  """

  @doc false
  def init(options), do: options

  @doc """
  Checks if the incoming request path has percent escaped characters.
  If so, the request path is decoded, and the connection query_string,
  path_info, and request_path are updated.
  """
  def call(conn = %Plug.Conn{request_path: request_path}, _opts) do
    if String.contains?(request_path, "%") do
      %URI{path: path, query: query} =
        request_path
        |> URI.decode
        |> URI.parse

      {request_path, path_info} = path(path)

      conn
      |> Map.put(:query_string, query(query))
      |> Map.put(:path_info, path_info)
      |> Map.put(:request_path, request_path)
    else
      conn
    end
  end

  defp query(nil), do: ""
  defp query(query_string), do: query_string

  defp path(nil), do: []
  defp path(request_path) do
    path_info =
      request_path
      |> String.split("/")
      |> Enum.filter(fn(segment) -> segment != "" end)

    {request_path, path_info}
  end
end
