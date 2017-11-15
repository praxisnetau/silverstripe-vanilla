<div id="$ID" class="form-group<% if $extraClass %> $extraClass<% end_if %>">
  <div class="form-inline">
    <input class="form-control mb-2 mr-sm-2 mb-sm-0<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('id', 'class', 'name', 'value', 'tabindex') name="{$Name}[0]" value="{$ValueOne}" $TabIndexHTML(0) />
    <input class="form-control mb-2 mr-sm-2 mb-sm-0<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('id', 'class', 'name', 'value', 'tabindex') name="{$Name}[1]" value="{$ValueTwo}" $TabIndexHTML(1) />
    <input class="form-control mb-2 mr-sm-2 mb-sm-0<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('id', 'class', 'name', 'value', 'tabindex') name="{$Name}[2]" value="{$ValueThree}" $TabIndexHTML(2) />
    <input class="form-control mb-2 mr-sm-2 mb-sm-0<% if $extraClass %> $extraClass<% end_if %>" $getAttributesHTML('id', 'class', 'name', 'value', 'tabindex') name="{$Name}[3]" value="{$ValueFour}" $TabIndexHTML(3) />
  </div>
</div>
