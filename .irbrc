require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'awesome_print'
AwesomePrint.irb!

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 25 entries in the list
IRB.conf[:SAVE_HISTORY] = 50

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = ".irb-history"

require 'calabash-cucumber/operations'
extend Calabash::Cucumber::Operations

require 'calabash-cucumber/launch/simulator_helper'
SIM=Calabash::Cucumber::SimulatorHelper

require 'calabash-cucumber/launcher'


def embed(x,y=nil,z=nil)
   puts "Screenshot at #{x}"
end


@ai=:accessibilityIdentifier
@al=:accessibilityLabel

def ids
  query("view", @ai).compact.sort.each {|x| puts "* #{x}" }
end

def labels
  query("view", @al).compact.sort.each {|x| puts "* #{x}" }
end

def nbl
    query("navigationButton", :accessibilityLabel)
end

def row_ids
  query("tableViewCell", @ai).compact.sort.each {|x| puts "* #{x}" }
end

puts "loaded #{Dir.pwd}/.irbrc"
puts "RESET_BETWEEN_SCENARIOS => '#{ENV['RESET_BETWEEN_SCENARIOS']}'"
puts "        DEVICE_ENDPOINT => '#{ENV['DEVICE_ENDPOINT']}'"
puts "          DEVICE_TARGET => '#{ENV['DEVICE_TARGET']}'"
puts "                 DEVICE => '#{ENV['DEVICE']}'"
puts "              BUNDLE_ID => '#{ENV['BUNDLE_ID']}'"
puts "           PLAYBACK_DIR => '#{ENV['PLAYBACK_DIR']}'"
puts "            SDK_VERSION => '#{ENV['SDK_VERSION']}'"
