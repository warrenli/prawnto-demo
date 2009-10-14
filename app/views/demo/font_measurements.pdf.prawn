pdf.instance_eval do

  font "Helvetica"
  font_size(144)

  word = "by"
  word_width = font.compute_width_of(word)
  word_height = font.ascender - font.descender

  x_left_edge = (bounds.width-word_width)/2.0
  x_right_edge = x_left_edge + word_width
  y_bottom_edge = (bounds.height-word_height)/2.0
  y_top_edge = y_bottom_edge + word_height
  y_baseline = y_bottom_edge - font.descender
  y_top_bounding_edge = y_bottom_edge + font.height

  text word, :at=>[x_left_edge,y_baseline]

  font_size(10)
  line_width = 1
  measure_cap_width = word_height / 5.0
  x_line = x_right_edge + measure_cap_width/2.0
  x_start_cap = x_line - measure_cap_width*2
  stroke do 
    line [x_line,y_top_bounding_edge], [x_line,y_bottom_edge]
    line [x_start_cap, y_top_bounding_edge], [x_start_cap+measure_cap_width*2.5, y_top_bounding_edge]
    line [x_start_cap, y_top_edge], [x_start_cap+measure_cap_width*2.5, y_top_edge]
    line [x_start_cap, y_baseline], [x_start_cap+measure_cap_width*2.5, y_baseline]
    line [x_start_cap, y_bottom_edge], [x_start_cap+measure_cap_width*2.5, y_bottom_edge]
  end

  small_height = font.ascender - font.descender
  text "line_gap", :at=>[x_line+measure_cap_width/4.0,(y_top_bounding_edge+y_top_edge-small_height)/2.0-font.descender]
  text "ascender", :at=>[x_line+measure_cap_width/4.0,(y_top_edge+y_baseline-small_height)/2.0-font.descender]
  text "|descender|  (is a negative value)", :at=>[x_line+measure_cap_width/4.0,(y_baseline+y_bottom_edge-small_height)/2.0-font.descender]

end

