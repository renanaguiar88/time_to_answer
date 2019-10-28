module SiteHelper
  def message_jumbotron
    case params[:action]
    when 'index' 
      "Ultimas perguntas cadastradas"
    when 'questions'
      "Resultados para o termo \"#{sanitize params[:term]}\"..."
    when 'subject'
      "Mostrando questões para o assunto \"#{sanitize params[:subject]}\"..."
    end
  end
end