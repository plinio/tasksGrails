<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="layout" content="main">
<title>Tarefas</title>
</head>
<body>
	<header>
		<span>Lista de Tarefas</span>
	</header>
	<main id="taskPage">
		<section id="taskCreation" class="not">
			<form id="taskForm">
				<input type="hidden" name="id" />
				<input type="hidden" name="completa" value="0" /> <!-- P4 - campo hidden para armazenar se a tarefa foi completada -->
				<div>
					<label>Tarefa</label> 
					<input type="text" required="required" name="task" class="large" placeholder="Nome da tarefa" maxlength="200" />
				</div>
				<div>
					<label>Finalizar até</label> <input type="date" required="required" name="requiredBy" />
				</div>
				<div>
					<label>Categoria</label> 
					<select name="category">
						<option value="Pessoal">Pessoal</option>
						<option value="Profissional">Profissional</option>
					</select>
				</div>
				<nav>
					<a href="#" id="saveTask">Salvar tarefa</a> <a href="#" id="clearTask">Limpar tarefa</a>
				</nav>
			</form>
		</section>
		<section>
			<table id="tblTasks">
				<colgroup>
					<col width="40%">
					<col width="15%">
					<col width="15%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>						
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<nav>
				<a href="#" id="btnAddTask">Adicionar tarefa</a>
			</nav>
		</section>
		<script>
			$(document).ready(function() {
				tasksController.init($('#taskPage'));
				tasksController.loadTasks();	
			});
		</script>
	</main>
	
</body>
</html>

<script id="taskRow" type="text/x-jQuery-tmpl">
	<tr id="${id}">
		<td>${task}</td>
		<td><time datetime="${requiredBy}"> ${requiredBy}</time></td>
		<td>${category}</td>
		<td>
			<nav>
				<a href="#" class="editRow" data-task-id="${id}">Editar</a>
				<a href="#" class="completeRow" data-task-id="${id}">Completar</a>
				<a href="#" class="deleteRow" data-task-id="${id}">Deletar</a>
			</nav>
		</td>
	</tr>
	</script>