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
		
		# redirect_to trainer_path(id: @pokemon.trainer_id)
		redirect_to levelup_path()

	end

	def heal
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health + 10
		@pokemon.save
		redirect_to trainer_path(id: current_trainer.id)

	end

	def new
    @pokemon = Pokemon.new
 	end

  def create
    @pokemon = Pokemon.new(pokemon_params)
		@pokemon.trainer = current_trainer
		@pokemon.level = 1
		@pokemon.health = 100
    if @pokemon.save
			redirect_to trainer_path(id: @pokemon.trainer_id)
		else
			render "new"
		end
  end

  def choose
  	@pokemon = Pokemon.first
	end

  def update
  	@pokemon = Pokemon.find(pokemon_params[:name].to_i)
  	@pokemon.level = @pokemon.level + 1
  	@pokemon.save
		redirect_to trainer_path(id: current_trainer.id)

  end

	private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
