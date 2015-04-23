# This class represents an aircraft and has type and size attributes,
# it also has an errors array to hold error messages when the parameters
# don't match with any item of the list of types and sizes.
class Aircraft
  # lists of types and sizes ordered by priority.
  # * Passenger AC's have removal precedence over Cargo AC's
  # * Large AC's of a given type have removal precedence
  #   over Small AC's of the same type
  TYPES = %w(passenger cargo)
  SIZES = %w(large small)
  attr_accessor :type, :size

  def initialize(params = {})
    @type = params[:type]
    @size = params[:size]
    # errors array to hold error messages if the parameters are invalid
    @errors = []
  end

  # adds invalid error message if the type or size is invalid,
  # returns true the errors array is empty
  def valid?
    @errors.push("invalid type #{type}") unless TYPES.any? { |t| t == type }
    @errors.push("invalid size #{size}") unless SIZES.any? { |s| s == size }
    @errors.empty?
  end

  # join sype and size in a sigle string used
  # in ac_queue to find the correct queue
  def type_size
    "#{type}#{size}"
  end

  # retuns errors list in a string
  def errors
    @errors.join(', ')
  end
end
