def init()
  widget_width = screen_width()
  border_size = 2
  board_width = calc_width(widget_width)
end

def on_resize(width)
  calc_resize(width)
end

def calc_width(width)
  width - @border_size
end