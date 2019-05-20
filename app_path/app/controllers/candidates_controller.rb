class CandidatesController < ApplicationController
  def index
  end

  def new
    @candidate = Candidate.new
  end
  def create
    @candidate = Candidate.new(candidate_params)
    # 透過同名的 @candidate
    # form_for(@candidate, html: {id: 'add_candidate_form'}) do |f| 
    # 會把東西塞進去 如果傳送失敗會重填表格

    if @candidate.save
      flash[:notice] = '新增成功' # 新增"新增成功"的輸出
      redirect_to "/"
    else
      flash[:notice] = '新增失敗' # 新增"新增失敗"的輸出
      # 待處理
      render :new # 重新載入
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :platform)
    # 上面的是參數白名單
  end

end