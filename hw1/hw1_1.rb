#!/usr/bin/env ruby
def palindrome?(string)
  normalized = string.strip().downcase().gsub(/\W/, '')
  return normalized == normalized.reverse()
end

def count_words(string)
  normalized = string.strip().downcase().gsub(/\W/, ' ')
  words_list = normalized.split()
  result = Hash.new
  words_list.each{|word| result[word] = (result[word] or 0) + 1}
  return result
end

