<fieldset class="fields">
  <% if $Legend %>
    <legend>$Legend</legend>
  <% end_if %>
  <% loop $Fields %>
    $FieldHolder
  <% end_loop %>
</fieldset>
