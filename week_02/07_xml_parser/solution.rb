xml = <<~STR
<note>
  <to>Tove</to>
  <from>Jani</from>
  <heading>Reminder</heading>
  <body>Don't forget me this weekend!</body>
</note>
STR

class XmlParser
  def self.parse(xml)
    array = xml.split("\n").map(&:strip)
    stack = []
    array.each do |line|
      start_tag = /<[a-z]+>/.match(line)
      # xml.match(/<\/#{start_tag[0]}/)
      if start_tag
        stack.push(start_tag[0])
      end
    end
    # start_tag_matcher = Regexp.new(/<[a-z]*>[a-zA-Z]*<\/[a-z]>/)
    puts stack
  end
end

XmlParser.parse(xml)


class Node
  def initialize
    @content = ""
    @attributes = {}
    @children = []
  end
end
