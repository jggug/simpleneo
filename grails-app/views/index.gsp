<%@ page import="org.jggug.simpleneo.Page" %>
<%
def page = Page.findByTitle('top')
def menu = Page.findByTitle('menu')
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
                ${page?.body}
              </wiki:show>
            </div>
        </div>
        <content tag="menu">
            <div class="wiki-content" style="width:100%;margin:15px 0 20px 0;">
              <wiki:show pageId="${menu?.id}">
                ${menu?.body}
              </wiki:show>
            </div>
            <sec:ifLoggedIn>
                <div class="nav">
                    <span class="menuButton">
                      <a href="${createLink(uri:'/create/new')}" class="create">新規ページ追加</a>
                    </span>
                </div>
            </sec:ifLoggedIn>
        </content>
    </body>
</html>
