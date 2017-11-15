<% loop $FieldList %>
  <% if $Up.ColumnCount %>
    <div class="col-sm col-count-{$Up.ColumnCount}<% if $FirstLast %> $FirstLast<% end_if %>">
      $FieldHolder
    </div>
  <% else %>
    $FieldHolder
  <% end_if %>
<% end_loop %>
