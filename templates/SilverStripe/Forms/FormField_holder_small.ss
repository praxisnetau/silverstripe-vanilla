<div id="$HolderID" class="form-group fieldholder-small<% if $Required %> required<% end_if %>">
  <% if $Title %><label class="form-control-label"<% if $ID %> for="$ID"<% end_if %>>$Title</label><% end_if %>
  $Field
  <% if $RightTitle %><div class="form-text text-muted right-title"<% if $ID %> for="$ID"<% end_if %>>$RightTitle</div><% end_if %>
</div>
