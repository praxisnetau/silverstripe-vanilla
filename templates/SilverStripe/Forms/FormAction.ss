<% if $UseButtonTag %>
  <button class="btn btn-primary<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('class')>
    <% if $ButtonContent %>$ButtonContent<% else %>$Title.XML<% end_if %>
  </button>
<% else %>
  <input class="btn btn-primary<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('class') />
<% end_if %>
