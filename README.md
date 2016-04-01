###A Reddit :trollface: replica - to learn the fundamentals of web development and Rails.
 
####Summary
 
Reddit is essentially a bulletin board system. Users (members) can submit content, such as text posts or direct links. Registered users can then comment on the post, vote submissions :arrow_up: up or :arrow_down: down to organise them and this determines it's position on the site. The post is also organised under a topic. 

![Output sample] (https://github.com/HocusPocus2015/bloccit/blob/master/app/assets/mybloccit.gif) 


####~~Problems~~ User Stories

|  |  | 
| ------------- | -----------|
| 1 | User should be able to Sign Up, Sign In & Sign Out                                                                               | 
| 2 | All users should be able to view Posts, ordered by Topics                                                                        | 
| 3 | If Signed In, User should be able to Comment on, Favourite and Vote on Post                                                      | 
| 4 | If Signed In, User should be able to create a Post                                                                               | 
| 5 | Users should only be able to delete and edit their own Posts                                                                     | 
| 6 | An Admin User should be able to delete and edit content of another User                                                          | 
 
####Solutions

|  |   |
| ------------- | -----------|
| 1 | `form_for` helper method allowed me to bind the form data to a model object. |
| 1 | I ensured that the entries on the forms were clean, correct and useful by :warning: *Data* *Validation*. |
| 1 | *Sessions* give me the ability to retain *state* throughout the application. This meant that users can  browse different pages and create and destroy connections. This is a fundamental for Sign in and out. |
| 2 |  Assigning *roles* to users allowed me to ensure rules and permission :no_entry_sign: for what individual users are allowed to access and do. | 
| 2 | I rendered different templates using Views, using embedded Ruby in tags and integrated with HTML. |
| 2 | The use of a database index (a data structure) improved :open_file_folder: data retrieval :fast_forward: speed. It quickly locates data rather than searching every record and row in the database. 
| 2 | We use *polymorphism* in the application to associate a label with more than one other object type. |
| 3 | Used Controllers to process request and produces the appropriate output. Performed CRUD (create :art:, read :book:, update :arrow_right_hook:, delete :x:) action via models. |
| 3 | Active record models are the layer responsible for representing data and logic. This facilitated the creation and use of objects whose data requires persistent storage to the :chart_with_downwards_trend: database. |
| 3 | Connecting the objects of an application to a table in the database was designed with the ORM(Object relational mapping) pattern. This meant that the properties and relationships of objects could be connected to a database without needing to write long SQL statements. |
| 3 | AJAX allows the creation of features that don’t require page  :arrows_counterclockwise: reloads. So when a user adds a comment, they see the comment immediately. JSON (JavaScript Object Novation) interchanges the data in a lightweight format, returning data to API.  |
| 4 | Seeded fake data to populate the database with `seed.rb`. This tested the functionality of each story. And much like the schema with active record migration I could evolve the database over time. |


####General Notes

+ Gems :ring: were installed to modify functionality of the Ruby application. 
+ Partial templates split the rendering process into manageable segments. 
+ Designed with a :sleeping: RESTful (representation state transfer) architecture style. Through the application the following properties were heavily considered: performance, scalability, simplicity, modifiability, visibility, portability and reliability.

####Testing

Different Rails environments were used to adapt behaviour dependant on circumstance - development, testing and production.
I used RSpec testing framework. The Rails test database allowed me to initiate and interact with test data in isolation so that production data was not compromised :closed_lock_with_key:.
This application was test driven- test code was written prior to production code.


 
 Made with the help of wonderful people :gift_heart: at [bloc](http://bloc.io).
