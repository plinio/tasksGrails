package tasksGrails
import grails.converters.JSON

class TaskController {
   def index() { 
        [categorias: Categoria.findAll()]
    }

    def add() {
        
    }


    def list = {

            def map = [:]
                        Task.findAll().each(){
                            map.put(it.id, it.toArray())
                        }
                    render(contentType: "text/json") {
                        map
                    }
    }


    def getById() {  
        def task
        task = Task.get(params.id)      
        render(contentType: "text/json") {
            task.toArray()
        }       
    }

    def delete(){      
        def task = Task.get(params.id)
        task.delete(flush:true)
        task.delete()
        render(contentType: "text/json") {
            task.toArray()
        }
    }

    def save(){     
        def category = Categoria.get(params.category)   
        def task        
        task = Task.get(params.id)
        if (params.id == '') {
            task = new Task()
        }
        task.completa = Integer.parseInt(params.completa)
        task.task = params.task 
        task.category = category
        task.requiredBy = new Date().parse('yyyy-MM-dd',params.requiredBy)
        task.save(flush: true)
        render(contentType: "text/json") {
            json
        }   
    }
}
