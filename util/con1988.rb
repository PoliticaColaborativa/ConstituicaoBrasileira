=begin
Copyright (c) 2014 Alexandre Magno <alexandre.mbm@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end

# sudo apt-get install ruby-nokogiri
# sudo apt-get install ruby-curb

require "curb"
require "nokogiri"

class Getter
  @@targets = {
    :con1988 => "http://www.senado.gov.br/legislacao/const/con1988/CON1988_05.10.1988/art_PATTERN_.shtm"
  }
  def initialize()
    @c = Curl::Easy.new    
  end
  def con1988(article)
    pattern = article.to_s
    @url = @@targets[:con1988].gsub! "PATTERN", pattern
    lines = css "div#conteudoConst p"
    nbsp = Nokogiri::HTML("&nbsp;").text
    str = ""
    lines.each do |p|
      text = p.text
                .gsub(nbsp, " ")
                .chomp
                .gsub(/\r/, "")
                .gsub(/^[ \t\n]*/, "")
                .gsub(/[ \t\n]*$/, "")
      case p["class"]
      when "artigo"
        str += text.gsub(/^(Art. [0-9]*º?)\.?/, '**\1**')
        str += "\n"
      when "inciso"        
        str += "* " + text.gsub(/-  /, "– ")
        str += "\n"
      when "alinea"
        str += " * " + text.gsub(")  ", ") ")
        str += "\n"
      when "paragrafo"
        str += text
                .gsub(/^(Parágrafo único.)/, "\n" + '**\1**')
                .gsub(/^(§ [0-9]*º)/, '* **\1**')
        str += "\n"
      end
    end
    str
  end
  private
  def css(css)
    @c.url = @url
    @c.perform
    page = Nokogiri::HTML @c.body_str
    page.css css
  end
end

require 'optparse'

options = {}
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: ruby con1988.rb ARTICLE"
  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

optparse.parse!

if ARGV.empty?
  puts optparse
  exit(-1)
end

article = ARGV.pop
raise "Need to specify a article to process" unless article

collector = Getter::new
str = collector.con1988(article)

File.write('art_' + article + '.md', str)
