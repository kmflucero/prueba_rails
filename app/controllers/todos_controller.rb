class TodosController < ApplicationController
	def index
		@todos = Todo.all
	end

	 def new 
    	@todo = Todo.new
    end 


    def create
        todo = Todo.new(todo_params)
        if todo.save
        	redirect_to todo, notice: ' se creo correctamente la tarea'
        else
        	redirect_to todos_new_path, notice: ' no se pudo crear la tarea'
        end 
    end

       def show
    	@todo = Todo.find(params[:id])
    end

     def edit
    	@todo = Todo.find(params[:id])
    end

    def update
    	@todo = Todo.find(params[:id]) 
    	if @todo.update(todo_params)
    		redirect_to @todo, notice: 'El Post se ha actualizado con exito '
    	else
    		redirect_to edit_todo_path(@todo.id), notice: 'No se ha podido actualizar el registro'
    	end 
    end

        def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to root_path, notice: 'El Post se ha eliminado con exito '
       
    end

    def complete
    	@todo = Todo.find(params[:id])
        @todo.completed = true
        @todo.save
        redirect_to root_path
    end

    def list
    	@todos = Todo.all

    end 





    private

    def todo_params
    	params.require(:todo).permit(:description, :completed)
    end
end
