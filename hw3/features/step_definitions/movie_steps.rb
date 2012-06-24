# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  regexp = /#{e1}.*#{e2}/m
  assert regexp.match(page.html) != nil, "Regexp #{regexp} failed to find in #{page.html}"
end

Then /I should see (all|no) movies/ do |all_no|
  if all_no == "all"
    expected = Movie.all.count
  else
    expected = 0
  end
  rows = page.all("table#movies tbody tr").length
  assert rows == expected, "#{expected} films expected, shown #{rows}"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rating|
    if uncheck == nil
      check("ratings_#{rating.strip}")
    else
      uncheck("ratings_#{rating.strip}")
    end
  end
end

When /I (un)?check all ratings/ do |uncheck|
  step "I #{uncheck}check the following ratings: G, PG, PG-13, R"
end
