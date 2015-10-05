class MainScene < MG::Scene
  def initialize
    Chocobo::Audio.play_theme("main-theme.mp3")
    @backgrounds = []

    add_floor
    add_walls

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
        add wall

        y -= img_size[:height]
        @backgrounds.last << wall
    end
  end
end
