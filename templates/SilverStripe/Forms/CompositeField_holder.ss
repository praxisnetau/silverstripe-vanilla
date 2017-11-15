<$Tag id="$HolderID" class="form-group<% if $extraClass %> $extraClass<% end_if %><% if $ColumnCount %> row<% end_if %>">
  <% if $Tag == 'fieldset' && $Legend %>
    <legend>$Legend</legend>
  <% end_if %>
  $Field
</$Tag>
