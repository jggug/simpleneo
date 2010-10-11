<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>${page.title}</title>
    </head>
    <body>
      <div class="body-block">

            <sec:ifLoggedIn>
            <content tag="menu">
            <div class="nav">
                <span class="menuButton">
                  <a href="${createLink(uri:'/create/new')}" class="create">新規ページ追加</a>
                </span>
            </div>
            <div class="nav">
                <g:if test="${page}">
                <span class="menuButton">
                  <a href="${createLink(uri:'/edit')}/${page.id}" class="create">編集</a>
                </span>
                </g:if>
            </div>
            </content>
            </sec:ifLoggedIn>

            <g:if test="${page.page}">
              <wiki:topicPath page="${page}" />
            </g:if>
            <div class="infomation_bar">
              追加したユーザーは ${page.created?.userRealName?:"不明"} です。最後に編集したユーザーは ${page.updated?.userRealName?:"不明"}で、その日時は <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${page.lastUpdated}"/> です。
            </div>

            <div class="wiki-content" style="width:100%;margin:15px 0 20px 0;">
              <wiki:show pageId="${page?.id}">
                ${page?.body}
              </wiki:show>
            </div>

            <div style="width:100%;margin:10px 0 10px 0;padding:10px 0 1px 0;border-bottom:2px solid #3C78B5">
                <b>子ページ</b>
                <sec:ifLoggedIn>
                <a href="${createLinkTo(url:'/')}/create/new?addChildTo=${page.id}">
                  <img src="${createLinkTo(dir:'images',file:'skin/database_add.png')}" 
                    border="0" align="absmiddle"/>&nbsp;追加
                </a>
                </sec:ifLoggedIn>
            </div>
            <g:if test="${page.pages.size()>0}">
            <div class="child-pages">
              <ul style="margin-top:5px">
              <g:each var="p" in="${page.pages?.sort{it.title}}">
                  <li>
                    <a href="${createLinkTo(url:'/')}/display/${p.title.encodeAsURL()}">
                    ${p.title?.encodeAsHTML()}</a>
                  </li>
              </g:each>
              </ul>
            </div>
            </g:if>
      </div>
    </body>
</html>
