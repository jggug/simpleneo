<html>
<head>
  <title>User Registered</title>
  <meta name="layout" content="main" />
</head>
<body>
  
  <div class="body">
    <h1>${message(code: 'registration.user.registered.label', default: 'User Registered')}</h1>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    
    ${message(code:'registration.user.registered.message', default: 'Check your email and activate your account.',args:[person.email,person.userRealName])}
    <br/>
    <g:link uri="/register/activate/${person?.activateKey}">${person?.activateKey}</g:link>

  </div>
  
<script type="text/javascript" charset="utf-8">

</script>
</body>
</html>
