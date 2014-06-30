# must type 'rackup' to run this code (layers: Web brick > Rack > Sinatra > My Code)
# things in initialize are only created on the loading of the server

require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = {

      :minestrone => {
        :description => "First week's soup at gSchool! A vegetable hearty minestrone with cubed hamsteak. This soup comes from my buddy Burr, though I add kidney beans to the mix because something feels wrong about a minestrone without them.",
        :ingredients => "<ul>
                          <li>1 Tbsp Ghee (or butter)</li>
                          <li>1 slice thickly sliced smoked ham, cubed</li>
                          <li>1 16oz can kidney beans, drained and washed</li>
                          <li>1 onion, diced</li>
                          <li>1 leek, sliced</li>
                          <li>3 cloves garlic, crushed</li>
                          <li>4 cups water</li>
                          <li>2 cups fresh tomatoes, crushed or 1 tin crushed tomatoes</li>
                          <li>2 Tbsp tomato paste</li>
                          <li>2 carrots, peeled and cubed</li>
                          <li>1 zucchini, sliced into quarter rounds</li>
                          <li>1/4 cup fresh basil (we usually skip, because you have to buy too much hehe)</li>
                          <li>2 bay leaves</li>
                          <li>1 cup Parmesan cheese, grated (optional)</li>
                          <li>salt and pepper to taste</li>
                        </ul>",
        :recipe => "<ol>
                      <li>In a large soup pot, heat(4.5-5) butter. Fry cubed ham until beginning to brown.</li>
                      <li>Add onion, leek and garlic and cook for a further 6-8 minutes or until softened.</li>
                      <li>Add 4 cups of water. Cover pot and boil.</li>
                      <li>Add tomatoes, tomato paste, carrots, zucchini, kidney beans, basil and bay leaves. Simmer for 20-30 minutes or until vegetables are tender.</li>
                      <li>(optional) Add Parmesan cheese. Cook for a further 5 minutes until cheese has melted through.</li>
                      <li>Season with salt and pepper to taste.
                   </ol>",
        :name => "Burr's Modified Minestrone"},

      :turkishlentil => {
        :description => "This week's soup came from the memories of a restaurant I miss dearly. <a href='https://plus.google.com/103046489691450635661/about?gl=us&hl=en'>Turkuaz Cafe</a> in Bloomington, IN. They make some of the most desirable meals in the city (a city, I might add, that has the most restaurants per square mile in the state). The soup I created for this week is essentially a customization of <a href='http://allrecipes.com/recipe/turkish-red-lentil-bride-soup/'> this recipe on allrecipes.com</a>",
        :ingredients => "<ul>
                          <li>1/4 cup butter</li>
                            <li>2 onions, diced</li>
                            <li>1 tsp paprika</li>
                            <li>1 cup green lentils</li>
                            <li>1/2 cup whole wheat bulgur</li>
                            <li>2 tbsp tomato paste</li>
                            <li>8 cups vegetable stock (I use Better than Boullion brand)</li>
                            <li>1 tsp cayenne pepper</li>
                            <li>1 pinch of dried mint leaves per serving</li>
                        </ul>",
        :recipe => "<ol>
                      <li>Melt the butter in a large saucepan over low heat. Cook the onions in the hot butter while stirring intermittenly until they are soft and a little browned, about 15 minutes.</li>
                        <li>Stir the paprika, lentils, and bulgur into the onions and coat with the butter.</li>
                        <li>Add the tomato paste, vegetable stock, and cayenne pepper; bring to a boil and simmer until soft and creamy, about 1 hour.</li>
                      <li>Put a pinch of dried mint leaves into a single serving.</li>
                    </ol>",
        :name => "Turkish Green Lentil"},

      :creamcauliflower => {
        :description => "Carrots and cauliflower concatenate cheesily in a soup using the underreated cauliflower. Cauliflower is treated like broccoli's weird brother, but it is crisp and delicious in this creamy soup.",
        :ingredients => "<ul>
                          <li>1 medium head cauliflower broken into florets</li>
                          <li>1 medium carrot, shredded</li>
                          <li>1/4 cup chopped celery</li>
                          <li>2-1/2 cups water</li>
                          <li>2 teaspoons chicken or 1 vegetable bouillon cube</li>
                          <li>3 tablespoons butter</li>
                          <li>3 tablespoons all-purpose flour</li>
                          <li>3/4 teaspoon salt</li>
                          <li>1/8 teaspoon peppe</li>
                          <li>2 cups milk</li>
                          <li>1 cup (4 oz) shredded cheddar cheese</li>
                          <li>2 teaspoons hot pepper sauce (optional)</li>
                         </ul>",
        :recipe => "<ol>
                     <li>In a large bowl, combine the cauliflower, carrot, celery, water and bouillon. Bring to a boil. Reduce heat; cover and simmer for 12-15 minutes or until vegetables are tender (do not drain).</li>
                     <li>In another large saucepan, melt butter. Stir in the flour, salt and pepper until smooth. Gradually add milk. Bring to a boil over medium heat; cook and stir for 2 minutes or until thickened. Reduce heat. Stir in the cheese until melted. Add hot pepper sauce if desired. Stir into the cauliflower mixture. Yield: 8 servings (about 2 quarts).</li>
                   </ol>",
        :name => "Cream Cauliflower"},
    }
  end



  get "/" do
    erb :root, :locals => { :items => @items }, :layout => :main_layout
  end

  get "/:itemkey/" do
    soupkey = (params[:itemkey]).to_sym
    p "*"*80
    puts @items[soupkey][:name]
    p "*"*80
    erb :souplist, :locals => { :name => @items[soupkey][:name],
                                :description => @items[soupkey][:description],
                                :ingredients => @items[soupkey][:ingredients],
                                :recipe => @items[soupkey][:recipe],
                                :items => @items},
                   :layout => :main_layout
  end

  get "/grumblepugs" do
    erb :grumblepugs
  end

  run! if app_file == $0
end
