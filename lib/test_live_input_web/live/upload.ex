defmodule TestLiveInputWeb.Upload do
  use TestLiveInputWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok, allow_upload(socket, :photo, accept: ~w(.png .jpeg .jpg), max_entries: 1)}
  end

  @impl true
  def handle_event("submit", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <form id="logo-upload" phx-submit="save" phx-change="validate">
    <%= live_file_input @uploads.photo %>
    <button type="submit">Upload</button>
    </form>
    """
  end
end
