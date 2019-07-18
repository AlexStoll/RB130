class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    @recordings.each { |recording| puts recording }
  end
end

# Listens, records if said.
# If nothing said, don't record anything.

listener = Device.new
listener.listen { "Hello World!"}
listener.listen
listener.play