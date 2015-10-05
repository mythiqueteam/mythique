class MainScene < MG::Scene
  def initialize
    Chocobo::Audio.play_theme("main-theme.mp3")
    @backgrounds = []

    add_floor
    add_walls
    add_hero

    contact = 0
    on_touch_begin do
      contact.even? ? start_update : stop_update
      contact += 1
    end

  end

  def add_floor
    x = 0
    @backgrounds << []

    img_size  = Chocobo::Image.texture_size("floor-2.png")

    round_height  = (Chocobo::Screen.size[:height] / img_size[:height]).floor
    round_width   = (Chocobo::Screen.size[:width] / img_size[:width]).floor

    y = Chocobo::Screen.size[:height] - (img_size[:height] / 2)

    round_height.times do

      round_width.times do
        floor = Chocobo::Image.get_texture("floor-2.png")
        floor.position = [x, y]
        add floor

        x += img_size[:width]
        @backgrounds.last << floor
      end

      x = 0
      y -= img_size[:height]
    end
  end

  def add_walls
    @backgrounds << []
    img_size  = Chocobo::Image.texture_size("wall.png")

    round_height  = (Chocobo::Screen.size[:height] / img_size[:height]).floor
    round_width   = (Chocobo::Screen.size[:width] / img_size[:width]).floor
    y = Chocobo::Screen.size[:height] - (img_size[:height] / 2)
    x = 0 + (img_size[:width] / 2)

    round_height.times do
        wall = Chocobo::Image.get_texture("wall.png")
        wall.position = [x, y]
        wall.attach_physics_box
        wall.dynamic = false
        wall.collision_mask
        add wall

        y -= img_size[:height]
        @backgrounds.last << wall
    end
  end

  def add_hero
    @hero = Chocobo::Image.get_sprite("hero.png")
    @hero.position = [200, 200]
    @hero.attach_physics_box
    @hero.dynamic = false

    add @hero
  end

  def update(delta)
    movment = 8
    position = @hero.position
    @hero.position = [position.x - movment, position.y + movment]
  end
end
