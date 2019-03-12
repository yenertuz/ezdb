require 'json'

hashy = JSON.parse(File.read(".test"), quirks_mode: true)

p hashy