class VehicleController < ApplicationController
  def new
    @partial = "vin"
  end

  def license_plate
    @partial = "license_plate"
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update("form", partial: @partial) }
      format.html { render :new }
    end
  end

  def make_model
    @partial = "make_model"
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update("form", partial: @partial) }
      format.html { render :new }
    end
  end

  def show_offer
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: turbo_stream.update("body", partial: "offer_summary")
      }
      format.html { render :new }
    end
  end

  def ssn
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: [
          turbo_stream.update("modal", partial: "ssn")
        ]
      }
      format.html { render :new }
    end
  end

  def success
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("body", partial: "success")
        ]
      }
      format.html { render :success }
    end
  end
end
