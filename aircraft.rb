class Aircraft

  #This class represents an aircraft and has type and size attributes, 
  #it also has an errors array to hold error messages when the parameters
  #don't match with any item of the list of types and sizes.

  
  #lists of types and sizes ordered by priority.
  #*Passenger AC’s have removal precedence over Cargo AC’s
  #*Large AC’s of a given type have removal precedence over Small AC’s of the same type

  TYPES = ["passenger",'cargo'] 
  SIZES = ["large","small" ]

  attr_accessor :type, :size 
  attr_reader :errors

  def initialize(params={})
    @type = params[:type]
    @size = params[:size]
    @errors = [] #errors array to hold error messages if the parameters are invalid
  end

  #adds invalid error message if the type or size is invalid, 
  #returns true the errors array is empty
  def valid? 
    errors << "Invalid type #{type}" unless TYPES.any?{|t| t == type}  
    errors << "Invalid size #{size}" unless SIZES.any?{|s| s == size}
    errors.empty?
  end
end




