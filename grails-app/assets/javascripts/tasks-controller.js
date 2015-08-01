tasksController = function() {
	function errorLogger(errorCode, errorMessage) {
		console.log(errorCode +':'+ errorMessage);
	}
	var taskPage;
	var initialised = false;   
	return {		
		init : function(page) {
			if (initialised) {
				
			} else {
				if(!initialised) {
					taskPage = page;
					storageEngine.init(function() {
						storageEngine.initObjectStore('task', function() {
							
						}, errorLogger) 
					}, errorLogger);
				
				$(taskPage).find( '[required="required"]' ).prev('label').append( '<span>*</span>').children( 'span').addClass('required');
				
				$(taskPage).find('tbody tr:even').addClass( 'even');
				
				$(taskPage).find( '#btnAddTask' ).click( function(evt) {
					evt.preventDefault();
					$(taskPage ).find('#taskCreation' ).removeClass( 'not');
				});
				
				$(taskPage).find('tbody tr' ).click(function(evt) {
					$(evt.target ).closest('td').siblings( ).andSelf( ).toggleClass( 'rowHighlight');
				});
				
				$(taskPage).find('#tblTasks tbody').on('click', '.deleteRow', 
				function(evt) { 									
					storageEngine.delete('task', $(evt.target).data().taskId, 
					function() {
						$(evt.target).parents('tr').remove(); 
						//ExercÃ­cio 1. limpa a lista e roda o loadTask novamente
						$(taskPage).find('#tblTasks tbody').empty();
						tasksController.loadTasks();
					}, errorLogger);
				});
				
				$(taskPage).find('#tblTasks tbody').on('click', '.completeRow', 
				function(evt) { 					
					storageEngine.findById('task', $(evt.target).data().taskId, function(task) { //usando o findById para selecionar a tarefa 
						task.completa = 1;
						storageEngine.save('task', task, function() { //salva normal
							$(taskPage).find('#tblTasks tbody').empty();
							tasksController.loadTasks();
							$(':input').val('');
							$(taskPage).find('#taskCreation').addClass('not');
						}, errorLogger);
					}, errorLogger);
				});	
				
				$(taskPage).find('#tblTasks tbody').on('click', '.editRow', 
	function(evt) { 
		$(taskPage).find('#taskCreation').removeClass('not');
		storageEngine.findById('task', $(evt.target).data().taskId, function(task) {
			$(taskPage).find('form').fromObject(task);
		}, errorLogger);
	}
);
		$(taskPage).find('#saveTask').click(function(evt) {
			evt.preventDefault();
			if ($(taskPage).find('form').valid()) {
				var task = $(taskPage).find('form').toObject();		
				storageEngine.save('task', task, function() {
					$(taskPage).find('#tblTasks tbody').empty();
					$(':input').val('');
					$(taskPage).find('#taskCreation').addClass('not');
					tasksController.loadTasks();
				}, errorLogger);
			}
		});
			initialised = true;
		}
	}
	},
		loadTasks : function() {
			storageEngine.findAll('task', 
			function(tasks) {
				tasks.sort(function(a, b){ // P5 - usando o método sort() com função que define o critério de ordenação
				if (a.requiredBy > b.requiredBy)
					return 1;
				if (a.requiredBy < b.requiredBy){
					return -1;
				}else return 0;
				});
				var contador = 0; // P1 - variável criada para contar as tarefas
				$.each(tasks, function(index, task) {
					contador++; // P1 - contador é incrementado dentro do laço
					$('#taskRow').tmpl(task ).appendTo($(taskPage).find('#tblTasks tbody'));
					switch (Date.today().compareTo(Date.parse(task.requiredBy))) { // P3 - usando o compareTo da lib datejs para saber a task que já passou da data
						case 1: 
							$("#"+task.id).addClass('overdue');
							break;
						case 0: //é hoje
							$("#"+task.id).addClass('warning');
							break;
						case -1: 
							$("#"+task.id).addClass('warning');
							break;
					}
					if(task.completa == 1){ // P4 - checando se a tarefa foi completada para esconder os botões
						$("#"+task.id).addClass('taskCompleted');
						$("#"+task.id).find(".editRow").hide();
						$("#"+task.id).find(".completeRow").hide();
						contador--; // P4 - contador é decrementado para não contar tarefas completadas
					}
				});
			$('#taskCount').empty();
			$('#taskCount').append(contador);
		}, 
			errorLogger);
		}}
	}();