class DemoController < ApplicationController

  def a4
    prawnto :prawn => { :page_size => 'A4' }
  end

  def attachment
    prawnto :inline => false
  end

  def attachment_xxx
    prawnto :filename => 'xxx.pdf', :inline => false
  end

  def variable
    @text = "Hello Controller Variable"
  end

  def dsl_locals
    @x = 'hello'
    @y = 'world'
    render :template=>'demo/dsl_locals', :locals=>{:x=>@x, :y=>@y}
  end

  def envelope
    prawnto :prawn => {
            :page_layout => :landscape, 
            :page_size => 'C6',
            :left_margin=>0,
            :right_margin=>0,
            :top_margin=>0,
            :bottom_margin=>0 }
  end

  def font_measurements
    options = {:page_layout=>:landscape}
    ["left","right","top","bottom"].each do |side|
      options[(side + '_margin').to_sym] = 36
    end
    prawnto :inline=>true, :prawn=>options
  end

  def inline
    prawnto :inline => true
  end

  def inline_xxx
    prawnto :filename => 'xxx.pdf', :inline => true
  end

  def landscape
    prawnto :prawn => { :page_layout => :landscape }
  end

  def manifest
    prawnto :prawn => {
              :page_layout => :landscape,
              :left_margin => 36,
              :right_margin => 36,
              :top_margin => 36,
              :bottom_margin => 36 }
    @orders = {
      'Dell'        => {'RCh'=>12, 'Rsm'=>1, 'sRsm'=>1, 'rPnr'=>3, 'lGh'=>1, 'GH'=>1},
      'Steiff'      => {'bPnr'=>10, 'Kh'=>1, 'Rsm'=>1},
      '7-Eleven'    => {'bPnr'=>2, 'Rsm'=>1},
      'Toys R Us'   => {'bPnr'=>2},
      'Stride Rite' => {'Rsm'=>1, 'rPnr'=>2}
    }
    translation = {'GH'=>'Grand Hijynx', 'RCh'=>'Red Corvette', 'Rsm'=>'Rushmore', 'rPnr'=>'retail Pantaloons'}
    @orders.each do |c,v|
      v.keys.each do |k|
        if translation[k]
          v[translation[k].gsub(" ","\n")] = v[k]
          v.delete(k)
        end
      end
    end
    @products = @orders.map{|c,v| v.keys}.flatten.uniq.sort
    @totals = Hash[*@products.map{|p| [p, @orders.inject(0) {|s,t| s + (t[1][p]||0)}]}.flatten]
    @table_headers = ['Customer'] + @products + ['Total Boxes']
    @table_values = @orders.map {|c,v| [c] + @products.map{|p| (v[p]||' ').to_s} + [v.values.sum.to_s]}
  end

  def thick_margins
    prawnto :prawn => {
              :left_margin=>150,
              :right_margin=>150,
              :top_margin=>300,
              :bottom_margin=>300 }
  end

end
