<% def config = org.codehaus.groovy.grails.commons.ConfigurationHolder.getConfig() %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>${config.simpleneo.contents.title} - <g:layoutTitle default="Wiki" /></title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'reset-fonts-grids.css')}">
    <link rel="stylesheet" href="${resource(dir:'css',file:'common.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'wiki.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />
    <style type="text/css" media="screen">
    #custom-doc { width: 90%; min-width: 550px; }
    </style>
    <g:pageProperty name="page.headadd"/>
</head>
<body>
    <div id="spinner" class="spinner" style="display:none;">
        <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
    </div>
    <div id="custom-doc" class="yui-t4">
        <div id="hd">
            <div class="header_block">
                <div class="head_bar">
                    <div style="float:left;">
                        <span style="font-size:10px;">ようこそ </span>
                        <sec:loggedInUserInfo field="username">ゲスト</sec:loggedInUserInfo><span style="font-size:10px;">さん</span>
                    </div>
                    <sec:ifLoggedIn>
                    <div style="font-size:10px;">
                    &nbsp;&nbsp;<g:link controller="logout" style="color:white;">(ログアウト)</g:link>
                    [<g:link controller="register" action="edit" style="color:white;">登録情報編集</g:link>]
                    </div>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                    <div style="font-size:10px;">
                        <g:link controller="login" style="color:white;">(ログイン)</g:link>
                        [<g:link controller="register" style="color:white;">登録</g:link>]
                    </div>
                    </sec:ifNotLoggedIn>
                </div>
                <%/** ロゴブロック */%>
                <div class="logo">
                  <a class="home" href="${createLinkTo(dir:'')}">
                   <span style="font-size:32px;">
                     <img src="${resource(dir:'images',file:'logo_2.png')}" border="0" align="middle"/>
                   </span>
                  </a>
                  <g:if test="${page}">
                    <a href="${createLinkTo(url:'/')}/display/${page.title}">
                    <span style="font-size:22px;font-weight:bold;">${page.title}</span>
                    </a>
                  </g:if>
                </div>
            </div>
        </div>
        <div id="bd">
            <div id="yui-main">
              <div class="yui-b">
                <div class="yui-g">
                  <g:layoutBody />
                </div>
              </div>
            </div>
            <div class="yui-b">
                <%/*Menu*/%>
                <g:pageProperty name="page.menu"/>
            </div>
        </div>
        <div id="ft" style="margin-top:10px;text-align:center;">
          <hr/>
          ${config.simpleneo.contents.footer.copy}
        </div>
    </div>
<g:javascript library="prototype" />
<g:pageProperty name="page.jsblock"/>
</body>
</html>