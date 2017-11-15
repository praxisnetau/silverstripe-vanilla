<$Tag id="$HolderID" class="form-group<% if $extraClass %> $extraClass<% end_if %><% if $ColumnCount %> row<% end_if %>">
  <% if $Tag == 'fieldset' && $Legend %>
    <legend>$Legend</legend>
  <% end_if %>
  <% loop $FieldList %>
    <% if $ColumnCount %>
      <div class="column-{$ColumnCount}<% if $FirstLast %> $FirstLast<% end_if %>">
        $SmallFieldHolder
      </div>
    <% else %>
      $SmallFieldHolder
    <% end_if %>
  <% end_loop %>
</$Tag>
