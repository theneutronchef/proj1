class PokemonsController < ApplicationController
	
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to "/"
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health - 10
		@pokemon.save
		if @pokemon.health <= 0
			@pokemon.destroy
		end
		redirect_to trainer_path(id: @pokemon.trainer_id)

	end

	def new
    @pokemon = Pokemon.new
 	end

  def create
    @pokemon = Pokemon.new(pokemon_params)
		@pokemon.trainer = current_trainer
		@pokemon.level = 1
		@pokemon.health = 100
		@warning = false
    if @pokemon.save
			redirect_to trainer_path(id: @pokemon.trainer_id)
		else
			@warning = true
			render "new"
		end
  end

	private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
