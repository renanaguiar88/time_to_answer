require 'net/http'

class ZipCode
  attr_reader :address, :neighborhood, :locality, :state
  END_POINT = "https://viacep.com.br/ws/"
  FORMAT = "/json"

  def initialize(zip_code)
    founded_zip_code = find(zip_code)
    set_data(founded_zip_code)
  end

  def address
    "#{@address} / #{@neighborhood} / #{@locality} - #{@state}" 
  end

  private 

  def set_data(founded_zip_code)
    @address = founded_zip_code["logradouro"]
    @neighborhood = founded_zip_code["bairro"]
    @locality = founded_zip_code["localidade"]
    @state = founded_zip_code["uf"]
  end

  def find(zip_code)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(URI("#{END_POINT}#{zip_code}#{FORMAT}"))
    )
  end
end
