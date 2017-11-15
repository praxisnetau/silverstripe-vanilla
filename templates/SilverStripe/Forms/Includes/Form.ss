<% if $IncludeFormTag %><form $AttributesHTML><% end_if %>
  <% include Forms\Message %>
  <% include Forms\Fields %>
  <% include Forms\Actions %>
<% if $IncludeFormTag %></form><% end_if %>
