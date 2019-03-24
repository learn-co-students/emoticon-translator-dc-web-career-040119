require "yaml"
# require modules here

def load_library(file_path)
  # code goes here
  lib = YAML.load_file(file_path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  lib.each do |a,b|
    hash["get_meaning"][b[1]] = a
    hash["get_emoticon"][b[0]] = b[1]
  end
  hash
end

def get_japanese_emoticon(file_path = "./lib/emoticons.", english)
  # code goes here
  lib = load_library(file_path)
  if lib["get_emoticon"].include?(english)
    return lib["get_emoticon"][english]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = "./lib/emoticons.", japanese)
  # code goes here
  lib = load_library(file_path)
  if lib["get_meaning"].include?(japanese)
    return lib["get_meaning"][japanese]
  else
    return "Sorry, that emoticon was not found"
  end
end