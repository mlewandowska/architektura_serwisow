atom_feed do |feed|
  feed.title "My Fortunes"
  feed.updated @fortunes.first.updated_at
  @fortunes.each do |fortune|
    feed.entry(fortune) do |entry|
      entry.content fortune.quotation, type: "html"
    end
  end
end
