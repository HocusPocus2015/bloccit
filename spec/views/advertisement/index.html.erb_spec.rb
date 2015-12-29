<h1>All Adverts</h1>
<% @advertisements.each do |advert| %>
  <div class="media">
    <div class="media-body">
      <h4 class="media-heading">
        <%= link_to "£#{advert.price}: #{advert.title}", advert%>
      </h4>
    </div>
  </div>
<% end %>