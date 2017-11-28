defmodule UriDecoderPlugTest do
  use ExUnit.Case
  use Plug.Test

  doctest UriDecoderPlug

  @opts UriDecoderPlug.init([])

  test "decodes the request path" do
    percent_encoded_conn =
      conn(:get, "%2Fone%2Ftwo")
      |> UriDecoderPlug.call(@opts)

    percent_decoded_conn =
      conn(:get, "/one/two")
      |> UriDecoderPlug.call(@opts)

    assert Map.drop(percent_encoded_conn, [:adapter]) == Map.drop(percent_decoded_conn, [:adapter])
  end

  test "decodes the request path with a query" do
    percent_encoded_conn =
      conn(:get, "%2Fone%2Ftwo%3Fquery%3Dparam")
      |> UriDecoderPlug.call(@opts)

    percent_decoded_conn =
      conn(:get, "/one/two?query=param")
      |> UriDecoderPlug.call(@opts)

    assert Map.drop(percent_encoded_conn, [:adapter]) == Map.drop(percent_decoded_conn, [:adapter])
  end
end
