<%@ page import="org.jggug.simpleneo.Page" %>
<%
Page page = Page.findByTitle('top')
String nonIndexMessage = '*Please create "top" Page* [top]'
%>
<html>
    <head>
        <title>Top</title>
        <meta name="layout" content="main" />
    </head>
    <body>
        <div id="pageBody">
            <div class="wiki-content" style="width:100%;margin:15px 0 20px 0;">
                <wiki:show pageId="${page?.id}">
                <sec:ifNotLoggedIn>
                    ${page?.body}
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    ${(page)?page.body:nonIndexMessage}
                </sec:ifLoggedIn>
                </wiki:show>
            </div>
        </div>
        <content tag="menu">

        </content>
    </body>
</html>
