class BusinessTypesController < ApplicationController

  def index
    @businessTypes = BusinessType.all
  end

end
