<select class="form-control custom-select<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('class')>
  <% loop $Options %>
    <% include SilverStripe\Forms\GroupedDropdownFieldOption %>
  <% end_loop %>
</select>
