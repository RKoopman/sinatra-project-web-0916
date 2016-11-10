+ New will create a record in the table and save the values.
+ Users need a collection of restaurants.
+ Restaurants need a collection of users.
- User/ Restaurants can change the list of Restaurants/ Users from their show page.
- Mass assignment
- Include API



<ul>
  <%User.all.each do |user|%>
    <li value="user.name"><%=user.name%></li>
  <%end%>
</ul>
