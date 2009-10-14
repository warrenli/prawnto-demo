pdf.text "Hello Super Template"
pdf.move_down 40
render :partial=>'partial', 
       :collection=>[1,2,3,4,5],
       :locals=>{:parent_pdf=>pdf}

