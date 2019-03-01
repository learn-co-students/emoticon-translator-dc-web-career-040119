# require modules here
require 'pry'
require 'yaml'

def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  translator = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons.each do |name, data|
    translator['get_meaning'][data[1]] = name
    translator['get_emoticon'][data[0]] = data[1]
  end
  translator
end

def get_japanese_emoticon(filepath, emoticon)
  translator = load_library(filepath)
  if translator['get_emoticon'].has_key?(emoticon)
    translator['get_emoticon'][emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(filepath, emoticon)
  translator = load_library(filepath)
  if translator['get_meaning'].has_key?(emoticon)
    translator['get_meaning'][emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end
