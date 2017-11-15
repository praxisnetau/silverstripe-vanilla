<% if $Message %>
  <div id="{$FormName}_error" class="message $MessageType">
    $Message
  </div>
<% else %>
  <div id="{$FormName}_error" class="message $MessageType" style="display: none"></div>
<% end_if %>
