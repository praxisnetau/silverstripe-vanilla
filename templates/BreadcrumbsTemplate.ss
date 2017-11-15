<% if $Pages %>
  <nav aria-label="breadcrumb" role="navigation">
    <ol class="breadcrumb">
      <% loop $Pages %>
        <% if $Last %>
          <li class="breadcrumb-item active" aria-current="page">$MenuTitle.XML</li>
        <% else %>
          <li class="breadcrumb-item">
            <% if not Up.Unlinked %><a href="$Link"><% end_if %>
            $MenuTitle.XML
            <% if not Up.Unlinked %></a><% end_if %>
          </li>
        <% end_if %>
      <% end_loop %>
    </ol>
  </nav>
<% end_if %>
