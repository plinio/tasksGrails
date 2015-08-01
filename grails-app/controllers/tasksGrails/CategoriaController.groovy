package tasksGrails
import grails.converters.JSON
class CategoriaController {
    static scaffold = true

	def list(){
    	render(contentType: "text/json") {
    		Categoria.findAll()
    	}
    }
}
