# Index View
#
# This is the blog homepage view. It
# contains methods that output a list
# of posts and other data for the view.
class Index < Layout
  def posts
    # TODO: Replace with production data
    @posts = [{
      title: 'First Entry',
      content: '<p>Shabby chic lo-fi seitan kogi forage cornhole, aesthetic gluten-free. High Life chambray skateboard, Austin fap art party readymade Neutra try-hard 90s brunch kale chips XOXO. Keffiyeh street art vinyl butcher Williamsburg occupy, bespoke readymade Banksy Godard. Pickled lo-fi Odd Future, Pinterest yr organic Tonx four loko keffiyeh forage salvia vinyl stumptown food truck. Pug organic aesthetic 90s, lo-fi narwhal mustache bitters Terry Richardson single-origin coffee Shoreditch. Organic selfies vegan quinoa 3 wolf moon. Blue Bottle gluten-free hoodie sriracha tousled salvia trust fund. Squid master cleanse synth gentrify selvage narwhal. Tonx gentrify meggings bitters, American Apparel chia Terry Richardson vinyl selvage sartorial. Slow-carb American Apparel chambray, Odd Future before they sold out banjo master cleanse pug Tonx meh pork belly tofu squid ennui. Drinking vinegar church-key craft beer freegan Wes Anderson, next level Thundercats 3 wolf moon selvage asymmetrical gastropub Neutra fixie. Marfa selfies before they sold out church-key, shabby chic pickled artisan bitters put a bird on it Shoreditch single-origin coffee PBR&B bespoke fingerstache. Blue Bottle chillwave Pinterest gluten-free bitters. Hashtag Brooklyn messenger bag, fixie pour-over shabby chic swag keffiyeh Intelligentsia food truck. Butcher Echo Park chambray, disrupt messenger bag keytar skateboard Austin typewriter. Fingerstache lomo viral, lo-fi pickled chia Pitchfork keffiyeh actually retro pour-over freegan street art Echo Park 3 wolf moon. Austin squid tofu, craft beer Wes Anderson typewriter lo-fi distillery fashion axe mustache scenester quinoa fanny pack PBR banjo. Biodiesel seitan farm-to-table chia fingerstache raw denim. Chambray hoodie PBR, cred bespoke kitsch Cosby sweater raw denim single-origin coffee Wes Anderson before they sold out ennui selvage. Distillery craft beer drinking vinegar, 90s kitsch Thundercats Tumblr ethical keytar. Pug Cosby sweater cornhole street art, readymade Carles asymmetrical. Mustache ugh fashion axe American Apparel meggings, yr quinoa YOLO biodiesel tote bag aesthetic chambray Wes Anderson. Freegan vinyl fixie retro. Organic High Life flexitarian next level, sartorial biodiesel mixtape letterpress drinking vinegar. Whatever deep v cardigan, kogi artisan try-hard semiotics. Selvage quinoa Truffaut Neutra, Portland blog Terry Richardson church-key VHS Tumblr chillwave salvia Williamsburg. Portland ennui master cleanse raw denim, ethnic flannel +1 Shoreditch fingerstache hella keytar Odd Future tousled. Church-key you probably havent heard of them craft beer try-hard dreamcatcher mustache Tonx single-origin coffee.</p>',
      slug: 'first-entry',
      excerpt: '<p>Shabby chic lo-fi seitan kogi forage cornhole, aesthetic gluten-free. High Life chambray skateboard, Austin fap art party readymade Neutra try-hard 90s brunch kale chips XOXO. Keffiyeh street art vinyl butcher Williamsburg occupy, bespoke readymade Banksy</p>',
      category: 'Sunshine',
      image: 'img/default_featured.png', # Here we're mimicking a default value
      published_on: 'January 5th, 2014',
      last_updated: 'February 5th, 2014',
      author: 'Bill'
    }]
    @posts
  end

  def author
    {
      bio: 'This is some bio text.'
    }
  end

  def has_categories
    true
  end

  def categories
    [{name: 'Sunshine', id: 1}, {name: 'Vacations', id: 2}, {name: 'Unicorns', id: 3}, {name: 'Bullshit', id: 4}]
  end

  def pagination
    {
      prev_page: false,
      next_page: 2
    }
  end
end
