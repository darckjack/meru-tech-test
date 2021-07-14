class Cell
  attr_accessor :mark, :value, :mine, :open

  def initialize(params = {})
    params.symbolize_keys!
    @mark = params[:mark]
    @value = params[:value].to_i
    @mine = params[:mine] || false
    @open = params[:open] || false
  end
end

