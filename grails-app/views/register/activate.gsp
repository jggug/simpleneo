<html>
<head>
  <title>User Activation</title>
  <meta name="layout" content="main" />
</head>
<body>
  
  <div class="body">
    <h1>${message(code: 'registration.user.activation.label', default: 'User Activation')}</h1>

    <g:if test="${flash.message}">
        <div class="message ${css}">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${person}">
    <div class="errors">
        <g:renderErrors bean="${person}" as="list" />
    </div>
    </g:hasErrors>
    <g:if test="${success}">
        ${message(code: 'registration.user.login.label', default: 'Please Login. ')}
            [ <a href="${createLink(controller:'login')}">Login</a> ]
    </g:if>
    
  </div>
  
<script type="text/javascript" charset="utf-8">

</script>
</body>
</html>
