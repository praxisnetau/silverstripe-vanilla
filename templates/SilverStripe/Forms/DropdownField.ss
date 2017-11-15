<select class="form-control custom-select<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('class')>
  <% loop $Options %>
    <option value="$Value.XML"<% if $Selected %> selected="selected"<% end_if %><% if $Disabled %> disabled="disabled"<% end_if %>>
      <% if $Title %>$Title.XML<% else %>&nbsp;<% end_if %>
    </option>
  <% end_loop %>
</select>
