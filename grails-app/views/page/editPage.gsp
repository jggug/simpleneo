<%@ page import="org.jggug.simpleneo.Page" %>
<%
def modeString=(mode=="edit")?"編集":"追加"
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>ページの${modeString}</title>

<style type="text/css" media="screen">
    .dialog .pagetitle {
        width:80%;
        font-size: 18px;
        padding: 5px;
    }
    h5.title { 
        font:bold 11px tahoma,arial,helvetica,sans-serif;
        color: #48802c;
    }
</style>
</head>
<body>
  <div>
    <h1 style="margin:3px 0px 5px 0px;">ページの${modeString}</h1>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${page}">
        <div class="errors">
            <g:renderErrors bean="${page}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="save" method="post" >
        <g:if test="${page.id}"><input type="hidden" name="id" value="${page?.id}"/></g:if>

    <div class="dialog">
      <div>
        <h5 class="title">Page Title</h5>
        <input type="text" id="title" class="pagetitle"
            name="title" value="${fieldValue(bean:page,field:'title')}"/>
      </div>
      <div>
        <h5 class="title">Wiki Content</h5>
        <textarea id="contents" style="width:100%;height:300px" name="body">${fieldValue(bean:page, field:'body')}</textarea>
      </div>

      <g:if test="${page.page!=null}">
        <div>
        <div>親ページ</div>
        <g:select optionKey="id" from="${Page.list()}" name="page.id" value="${page?.page?.id}" noSelection="['null':'']"></g:select>
        </div>
      </g:if>

    </div>
    <div class="buttons">
      <g:if test="${page.id}">
        <span class="button"><input class="save" type="submit" value="Update" /></span>
        <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
      </g:if>
      <g:else>
        <span class="button"><input class="save" type="submit" value="Create" /></span>
      </g:else>
      <span class="button">
        <input type="button" onclick="updatePreview();return false;" class="preview" value="Preview" />          
      </span>
    </div>
    </g:form>
    
    <script language="javascript">
      var updatePreview=function(){
        var params=$("contents").serialize();
        new Ajax.Updater("preview","${createLink(controller:'page',action:'preview')}",
          {asynchronous:true,evalScripts:true,parameters:params});
      };
    </script>
    <div class="wiki-content">
        <div id="preview"></div>
    </div>
  </div>
</body>
</html>
