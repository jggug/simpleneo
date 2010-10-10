<html>
<head>
  <title>Registration</title>
  <meta name="layout" content="main" />
</head>
<body>
  
  <div class="body">
    <h1>${message(code: 'registration.title.label', default: 'Account Registration')}</h1>

    <g:if test="${flash.message}">
        <div class="message error">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${person}">
    <div class="errors">
        <g:renderErrors bean="${person}" as="list" />
    </div>
    </g:hasErrors>
    ${person?.activateKey}
    <g:form action="entry">
    <div class="dialog">
    <table>
    <tbody>
        <tr class='prop'>
            <td valign='top' class='name'><label for='username'><g:message code="person.username.label" default="User Name" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'username','errors')}">
                <input type="text" name='username' value="${username?.encodeAsHTML()}" autocomplete='off'/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='userRealName'><g:message code="person.userRealName.label" default="Your Real Name" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
                <input type="text" name='userRealName' value="${userRealName?.encodeAsHTML()}" autocomplete='off'/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='passwd'><g:message code="person.password.label" default="Password" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'password','errors')}">
                <input type="password" id='passwd' name='passwd' value="${passwd}"
                    onchange="checkPass();" onkeyup="checkPass();"/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='passwd2'><g:message code="person.repassword.label" default="Confirm Password" />:</label></td>
            <td valign='top' class='value ${hasErrors(bean:person,field:'password','errors')}'>
                <input type="password" id='repasswd' name='repasswd' value="${repasswd}"
                    onchange="checkPass();" onkeyup="checkPass();"/>
                <span id="passchk_box" style="mergin-left:18px;"></span>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='email'><g:message code="person.email.label" default="Email" />:</label></td>
            <td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
                <input type="text" name='email' value="${email?.encodeAsHTML()}"/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='bottom' class='name'><label for='code'><g:message code="person.entrycode.label" default="Enter Code" />: </label></td>
            <td valign='top' class='value'>
                <input type="text" name="captcha" size="8" autocomplete='off'/>
                <br/>
                <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
            </td>
        </tr>
    </tbody>
    </table>
    </div>

    <div class="buttons">
        <span class="formButton">
            <input class='save' type="submit" value="${message(code: 'default.button.entry.label', default: 'Create')}"></input>
        </span>
    </div>

    </g:form>

  </div>
  
<script type="text/javascript" charset="utf-8">
var elm = function(v){return document.getElementById(v);};
var checkPass = function(){
    if(elm('passwd').value!='')
    if(elm('passwd').value == elm('repasswd').value){
        elm('passchk_box').innerHTML="<span style='color:blue;'>OK</span>";
    }else{
        elm('passchk_box').innerHTML="<span style='color:red;'>Not match</span>";
    }
};
</script>
</body>
</html>
