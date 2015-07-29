package tasksgrails

class Task {

    static constraints = {
    	id(unique: true)
    }

    Integer id
    String task
    Integer completa = 0
    Date requiredBy
}
