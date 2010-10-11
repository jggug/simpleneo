package org.jggug.simpleneo

class HomeController {

    def wikiEngine
    def wikiContext

    def index = { }

    def example = {
        String content = '''
h4. 見出し
*bold* _italic_ --打ち消し線-- 
+下線+ [http://host.com]
!http://data.tumblr.com/ssAi2tLBi7axjdhnxt0LYgJ6_400.jpg!

||a||b||c||
|a|b|c|
|a|b|c|

h4. コード:
{code}
    //code here
{code}
{code:java}
public class Book {
  String name="title";
}
{code}
{code:xml}
<tags>
    <tag></tag>
</tags>
{code}
        '''
        def text = wikiEngine.render(content.trim(),"0", wikiContext)
        println text
        render(text:text)
    }
}
