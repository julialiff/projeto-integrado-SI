module UsersHelper
  def mascara_documento(doc)
    if @user.documento.length() == 11
      # CPF:
        return doc[0..2] + '.' + doc[3..5] + '.' + doc[6..8] + '-' + doc[9..10]
    end
  end
end
