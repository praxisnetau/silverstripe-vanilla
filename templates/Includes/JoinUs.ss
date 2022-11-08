<div class="sharethis">
  <hr />
  <h3>FOLLOW US</h3>
  <% with Siteconfig %>
  <p>
    <% if $FacebookLink %><a href="$FacebookLink" ><i class="fa-brands fa-facebook"></i></a><% end_if %>
    <% if $TwitterLink %><a href="$TwitterLink" ><i class="fa-brands fa-twitter"></i></a><% end_if %>
    <% if $LinkedInLink %><a href="$LinkedInLink" ><i class="fa-brands fa-linkedin"></i></a><% end_if %>
    <% if $InstagramLink %><a href="$InstagramLink" ><i class="fa-brands fa-instagram"></i></a><% end_if %>
    <% if $YouTubeLink %><a href="$YouTubeLink" ><i class="fa-brands fa-youtube"></i></a><% end_if %>
    <% if $VimeoLink %><a href="$VimeoLink" ><i class="fa-brands fa-vimeo"></i></a><% end_if %>
  </p>
  <% end_with %>
  <p class="login-buttons">
  <a href="$JoinUsLink" class="btn btn-primary" role="button">Newsletter Sign-up</a>
  </p>
</div>
