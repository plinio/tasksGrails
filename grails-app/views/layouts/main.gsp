<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Tasks"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="02-tasks.css"/>
  		<!--<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>-->
		<asset:javascript src="jquery-2.1.4.min.js"/>
		<asset:javascript src="jquery.validate.js"/>
		<asset:javascript src="date.js"/>
		<asset:javascript src="jquery-tmpl.js"/>
		<asset:javascript src="jquery-serialization.js"/>
		<asset:javascript src="tasks-controller.js"/>
		<asset:javascript src="tasks-webstorage.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
		<footer>Você tem <span id="taskCount">0</span> tarefas</footer> 
	</body>
</html>
