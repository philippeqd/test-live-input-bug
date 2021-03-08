defmodule TestLiveInputWeb.Upload do
  use TestLiveInputWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok, allow_upload(socket, :photo, accept: ~w(.png .jpeg .jpg), max_entries: 1)}
  end

  @impl true
  def handle_event("save", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    # The tests pass if you remove the surrounding <div>
    ~L"""
    <div>
      <form id="logo-upload" phx-submit="save" phx-change="validate" phx-target="<%= @myself %>">
      <%= live_file_input @uploads.photo %>
      <button type="submit">Upload</button>
      <%= for entry <- @uploads.photo.entries do %>
        <progress max="100" value="<%= entry.progress %>" class="h-1 w-40"/>
      <% end %>
      </form>
    </div>
    """
  end
end
