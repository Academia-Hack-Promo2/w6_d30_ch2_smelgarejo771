class TodosController < ApplicationController

	def show
		todos = Todo.all
		render json: todos.to_json 
	end

	def showspecifit
	 	aux = Todo.exists?((params[:id].to_i))
	 	if aux == true
	 		todo = Todo.find((params[:id].to_i))
	 		render json: todo.to_json
	 	else
	 		render json: {"Error" => "El usuario no existe"}
	 	end
	end

	def create
	 	todo = Todo.new(todo_params)
		todo.save
		render json: todo.to_json
	end

	def update
		aux = Todo.exists?((params[:id]).to_i)
		if aux == true
			todo = Todo.find((params[:id]).to_i)
			todo.update(todo_params)
			todo.save
			render json: todo.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end
	end	

	def delete
	 	aux = Todo.exists?((params[:id]).to_i)
		if aux == true
			todo = Todo.find((params[:id]).to_i)
			todo.delete
			render json: todo.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end
	end

	private

	def todo_params
	 	params.permit(:text, :done)
	end 

end
