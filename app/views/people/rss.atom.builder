atom_feed do |feed|
  feed.title("nbspace::socionics")
  feed.updated(@people.first.created_at)
  
  @people.each do |person|
    feed.entry(person) do |entry|
      entry.title(person.title)
      entry.content(person.content, :type => 'html')
      
      entry.author{ |author| author.name(person.user.login)}
    end
  end
end
