<aside class="col-md-3 sidebar">
  <% if $Menu(2) %>
    <nav class="secondary">
      <% with $Level(1) %>
        <h3>$MenuTitle.XML</h3>
        <% include Sidebar\Menu %>
      <% end_with %>
    </nav>
  <% end_if %>
</aside>
