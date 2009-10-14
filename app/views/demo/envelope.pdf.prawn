pdf.font 'Helvetica'
pdf.bounding_box([10,313], :width=>150, :height=>100) do
  pdf.font_size(10)
  pdf.text 'Superman'
  pdf.text '789 Ice Fortress Lane'
  pdf.text 'North Pole, Arctic 00000'
end

pdf.bounding_box([160,200], :width=>200, :height=>100) do
  pdf.font_size(16)
  pdf.text 'Louis Lane'
  pdf.text 'c/o Daily Planet'
  pdf.text '101 Main Street'
  pdf.text 'Metropolis, USA 99999'
end

pdf.bounding_box([400,313], :width=>50, :height=>50) do
  pdf.line_width = 2
  pdf.stroke_rectangle [0,50], 50, 50
  pdf.stroke_line 0,0,50,50
  pdf.stroke_line 0,50,50,0
  pdf.font 'Helvetica-Bold'
  pdf.font_size(12)
  pdf.text "\nSTAMP\nHERE", :align=>:center
end

pdf.bounding_box([250,15], :width=>200, :height=>15) do
  pdf.font 'Helvetica'
  pdf.font_size(8)
  pdf.text 'printing envelopes from a web page = priceless!'
end

