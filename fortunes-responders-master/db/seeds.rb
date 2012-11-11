platitudes = File.readlines(Rails.root.join('db', 'platitudes.u8'), "\n%\n")
tags = ['always', 'always', 'sometimes', 'never', 'maybe', 'ouch', 'wow', 'nice', 'wonderful']

platitudes.map do |p|
  reg = /\t?(.+)\n\t\t--\s*(.*)\n%\n/m
  m = p.match(reg)
  if m
    f = Fortune.new :quotation => m[1], :source => m[2]
  else
    f = Fortune.new :quotation => p[0..-4], :source => Faker::Name.name
  end
  f.tag_list = tags.sample(rand(tags.size - 3))
  f.save
end
