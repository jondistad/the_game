class Player
  include Gosu
  SPEED = 2
  def initialize(window)
    @window = window
    @x = @window.width / 2
    @y = @window.height / 2
    @vx = @vy = 0
    @sprite = PlayerSprite.new(@window)
  end

  def start_down()  @vy = SPEED  end
  def start_up()    @vy = -SPEED end
  def start_left()  @vx = -SPEED end
  def start_right() @vx = SPEED  end

  def stop_down()  @vy = 0 end
  def stop_up()    @vy = 0 end
  def stop_left()  @vx = 0 end
  def stop_right() @vx = 0 end

  def direction
    return :right if @vx > 0
    return :left if @vx < 0
    return :up if @vy < 0
    return :down if @vy > 0
    :still
  end

  def draw
    @sprite.send(direction).draw(@x - 20, @y - 20, 0)
  end

  def update
    unless off_screen?
      @x += @vx
      @y += @vy
    end
  end

  def off_screen?
    out = false
    out = true unless (0..@window.width).include?(@x + @vx)
    out = true unless (0..@window.height).include?(@y + @vy)
    out
  end
end
