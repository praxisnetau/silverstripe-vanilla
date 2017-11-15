<div id="$HolderID" class="form-group field<% if $extraClass %> $extraClass<% end_if %><% if $Required %> required<% end_if %><% if $MessageType %><% include Forms\State\Holder Type=$MessageType %><% end_if %>">
  <% if $Title %><label class="form-control-label" for="$ID">$Title</label><% end_if %>
  $Field
  <% if $Message %><div class="form-control-feedback message $MessageType">$Message</div><% end_if %>
  <% if $RightTitle %><div class="form-text text-muted right-title">$RightTitle</div><% end_if %>
  <% if $Description %><small class="form-text text-muted description">$Description</small><% end_if %>
</div>
