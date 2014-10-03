class PostIndex < PostLayout
  puts "I ran!!!!!!!!!!"

  def something
    @something || "Things are not working"
  end

  def another_thing
    puts "I ALSO ran..."
    "Another thing, please?"
  end
end
