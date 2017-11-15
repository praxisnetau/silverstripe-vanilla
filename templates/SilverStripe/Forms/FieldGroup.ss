<div id="$ID" class="row<% if $extraClass %> $extraClass<% end_if %><% if $Zebra %> fieldgroup-{$Zebra}<% end_if %>">
  <% loop $FieldList %>
    <div class="fieldgroup-field col-sm $EvenOdd<% if $FirstLast %> $FirstLast<% end_if %>">
      $SmallFieldHolder
    </div>
  <% end_loop %>
</div>
