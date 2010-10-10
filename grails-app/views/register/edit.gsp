<html>
<head>
  <title>Registration</title>
  <meta name="layout" content="main" />
</head>
<body>
  
  <div class="body">
    <h1>${message(code: 'registration.title.label', default: 'Account Edit')}</h1>

    <g:if test="${flash.message}">
        <div class="message error">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${person}">
    <div class="errors">
        <g:renderErrors bean="${person}" as="list" />
    </div>
    </g:hasErrors>
    <g:form action="update">
    <div class="dialog">
    <table>
    <tbody>
        <tr class='prop'>
            <td valign='top' class='name'><label for='username'><g:message code="person.username.label" default="User Name" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'username','errors')}">
                <span class="edit_username">${person.username?.encodeAsHTML()}</span>
                <input type="hidden" name='username' value="${person.username}"/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='userRealName'><g:message code="person.userRealName.label" default="Your Real Name" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'userRealName','errors')}">
                <input type="text" name='userRealName' value="${person.userRealName?.encodeAsHTML()}" autocomplete='off'/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='passwd'><g:message code="person.password.label" default="Password" />:</label></td>
            <td valign='top' class="value ${hasErrors(bean:person,field:'password','errors')}">
                <input type="password" id='passwd' name='passwd' value=""
                    onchange="checkPass();" onkeyup="checkPass();"/>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='passwd2'><g:message code="person.repassword.label" default="Confirm Password" />:</label></td>
            <td valign='top' class='value ${hasErrors(bean:person,field:'password','errors')}'>
                <input type="password" id='repasswd' name='repasswd' value=""
                    onchange="checkPass();" onkeyup="checkPass();"/>
                <span id="passchk_box" style="mergin-left:18px;"></span>
            </td>
        </tr>

        <tr class='prop'>
            <td valign='top' class='name'><label for='email'><g:message code="person.email.label" default="Email" />:</label></td>
            <td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
                <input type="text" name='email' value="${person.email?.encodeAsHTML()}"/>
            </td>
        </tr>

    </tbody>
    </table>
    </div>

    <div class="buttons">
        <span class="formButton">
            <input class='save' type="submit" value="${message(code: 'default.button.entry.label', default: 'Update')}"></input>
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
