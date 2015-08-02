package tasksGrails
import org.grails.databinding.BindingFormat
class Task {

    static constraints = {
    	id(unique: true)
    }

    Integer id
    String task
    Integer completa = 0

    @BindingFormat('yyyy-MM-dd')
    Date requiredBy
    
    Categoria category
    static belongsTo = Categoria

    def toArray(){
    	return [id: this.id, task: this.task, completa: this.completa, requiredBy: this.requiredBy.format('yyyy-MM-dd'), category_desc: this.category.descricao, category: this.category.id]
    }
}
