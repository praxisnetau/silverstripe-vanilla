<!DOCTYPE html>

<html class="no-js" lang="$ContentLocale">
  <head>
    $ExtendedMetatags
    <% require themedCSS('production/styles/bundle') %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <script async src=https://www.googletagmanager.com/gtag/js?id=G-RNQZLSEB0X></script>
    <script>
window.dataLayer = window.dataLayer || []
function gtag () {
  window.dataLayer.push(arguments)
}
gtag('js', new Date()); gtag('config', 'G-RNQZLSEB0X')
    </script>
    <%-- require css('http://localhost:8080/production/styles/bundle.css') --%>
  </head>
  <body>

    <% include Header %>

    <% include Layout Layout=$Layout %>

    <% include Footer %>
    <% require themedJavascript('production/js/bundle') %>
    <%-- require javascript('http://localhost:8080/production/js/bundle.js') --%>
    <% if $IsAdmin %>
    <a href="$CMSEditLink" class="btn btn-danger" role="button">Edit this page</a>
    <% end_if %>

  </body>
</html>
