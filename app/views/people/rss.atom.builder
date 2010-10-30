atom_feed do |feed|
  feed.title("nbspace::socionics")
  feed.updated(@people.first.created_at)
  
  @people.each do |person|
    feed.entry(person) do |entry|
      entry.title(person.title)
      entry.content(person.content, :type => 'html')
      entry.updated(person.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author{ |author| author.name(person.user.login)}
    end
  end
end
