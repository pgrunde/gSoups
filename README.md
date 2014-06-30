# Exploring HTTP with Sinatra

## References
* Information about spikes
    * [http://www.lagerweij.com/2013/04/12/spikes-theyre-sharp/](http://lagerweij.com/2013/04/12/spikes-theyre-sharp/)
    * [http://scaledagileframework.com/spikes/](http://scaledagileframework.com/spikes/)
* [Sinatra documentation](http://www.sinatrarb.com/documentation.html)
* [Online Sinatra book](http://sinatra-book.gittr.com/)
* [eRb templates](http://www.stuartellis.eu/articles/erb/)
* [Ruby heredocs](http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html)
* [More info about HTTP and Rails](http://robots.thoughtbot.com/back-to-basics-http-requests)

## Goals

A student should be able to:

* Understand what a 'spike' is and why they are useful in software development
* Be able to define Sinatra routes, with the proper HTTP verb, for different endpoints
* Understand concept of localhost and a hosts file
* Create eRb templates to render HTML

## Tech skills learned

* Sinatra
* HTTP
* eRb (Embedded Ruby) templates
* Ruby heredocs

## Spiking

* Research/understanding
    * Starts with a specific question/hypothesis
    * End with an answer/data to above
* No tests
* [Timeboxed](http://en.wikipedia.org/wiki/Timeboxing)
* Throw away code
    * The deliverable is the knowledge gained, not production code
    * Implementing production tests/code will now go faster because you understand problem

## Exercise

Simply run `bundle` to get sinatra installed. To run your application type `rackup` and that's it!

* Implement an endpoint `/`, also known as the root of the site
    * Displays a page with a link to the items page found at `/items`.

* Implement the `/items` endpoint
    * Shows a web page with a list (`ul`) of 3 menu items on it. Each item (`li`) displays a name.
    * Shows a link to the `/items/new` endpoint at the top of the page.
    * Shows a "Show Item" link for each item in the list. The link should link to the
    `/item/[item id]` endpoint. For example, for item with id 1, the href of the link should be
    `/item/1`.

* Talk about what localhost is and what a hosts file is

Implement solutions to the following exercises in addition to the two demo exercises above.
You should create a new, well named directory in your gSchool working directory and initialize a
Git repository there. You should also create a remote GitHub repository and push all changes to that repository.
Additionally, you should create a Heroku application and deploy your finished application there.

#### 1. Users can filter the items

Modify the `/items` endpoint to look for a query parameter "filter" that contains a string to filter
the items by.

  * If you have three items "Channa Masala", "Chicken Tikka Masala", "Saag Paneer" and
  the query param is "saag", then only "Saag Paneer" will show up on the `/items` page (`/items?filter=saag`).
  * If the filter param is empty then all items show up on the page.
  * If the filter param does not match any of the items, then nothing displays on items page.

#### 2. Users can create a new item

Implement a `/items/new` endpoint that simply displays an empty form to enter a new item.

  * It will display an [HTML form](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms),
  a text box and a submit button.
  * The form will submit to the `/items` endpoint, written next, and use the value of the text box to create a new
  item. You will need to figure out what the form method is, keeping in mind that this creates a new item. Hint: the method you need is not GET.

Implement a `/items` endpoint that will receive the form data from above and create a new item.

  * You need to figure out what the correct HTTP verb to use here since you already have a `/items` endpoint
  that uses the GET verb. This will be the same as the form method from above.
  * After successfully adding a new item, you should redirect to the '/items' page.

#### 3. Users can see a single item

Implement a `/items/:id` endpoint with the proper HTTP verb for showing a single item

  * If the `:id` parameter is a key of the items hash, then display a page that has an `h1` that has the
  text "Showing [item name]". Beware all values in the params hash are strings and your items has has integers as keys.
  * If the :id parameter is a key that doesn't exist (for example id = 5 doesn't exist in our system immediately), then
  return the status code for Not Found and a generic :not_found template.

#### 4. Users can edit / update items

Add a edit link to the to the `/items/:id` page

  * This link will point to the `/items/[item id]/edit` endpoint.
  * For example, if you are looking at `/items/2` then the link will be `/items/2/edit`.

Implement a `/items/:id/edit` endpoint that displays the same form used in the `/items/new` endpoint.

  * The form url is `/items/[id of the item you are looking at]`. For example, `/items/2`.
  * The form method will be `post` but you will also have to send Sinatra the HTTP verb for updating an item (remember what it is?)
  since the browser won't send the right one.
  See [this post](http://mikeebert.tumblr.com/post/26877173686/quick-tip-using-put-and-delete-in-sinatra)
  for how to send additional verbs other than POST from an HTML form to Sinatra.
  * If the `:id` parameter is an index that doesn't exist (for example id = 5), then do not display the form but
  return the status code for Not Found and a generic `:not_found` template since the item doesn't exist in our system.

Implement a `/items/:id` endpoint that will receive the data from the form implemented above.

You will need to figure out what HTTP verb to use since you already have a `/items/:id` endpoint that uses the GET verb.

  * The value of the text box will update the item at the location in the hash denoted by
  the id. For example, if I go to `/items/1/edit` and enter "Tandoori Chicken" then the item at id 1 in the items
  hash will now be "Tandoori Chicken" instead of "Chicken Tikka Masala" from the demo.
  * The user will be redirected to the '/items' page.

#### 5. Users can delete items

Add a delete button to the `/items/:id` page for each item.

  * This button will be the submit button of a form with no form fields that issues a request to the
  URL `/items/[id of the item]` with the form action of 'post' and a hidden action that you specify (see post from above).
  * For example, if I am drawing the delete button for the item of id 1, then the URL for the form will be `/items/1`.

Implement a `/items/:id` endpoint that removes the item with the id passed in.

  * If the item does not exist, then you don't have to do anything special just return an OK status.
  * Redirect the user to the '/items' page.
  * Why do the edit and update endpoints for an item (`/items/:id`) return a status of Not Found when the item does not exist but this
  endpoint doesn't? Leave the answer in a comment at the top of this route in your code.
