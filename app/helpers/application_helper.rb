module ApplicationHelper
  def phone_mask(phone)
    phone = phone.nil? ? '' : phone.gsub(/\D/, '')
    if phone.length == 11
      return "(" + phone[0..1] + ") " + phone[2..6] + '-' + phone[7..-1]
    elsif phone.length == 10
      return "(" + phone[0..1] + ") " + phone[2..5] + '-' + phone[6..-1]
    else
      return phone
    end
  end


  def qtd_carrinho
    if current_user
      current_user.carrinhos.count
    else
      0
    end
  end

  def get_product(product_id)
    Product.find(product_id)
  end

  def qtd_produtos(comerciante_id)
    # Retorna a quantidade de produtos de um determinado vendedor
    Product.where(comerciante_id: comerciante_id).count
  end

  def qtd_pedidos(comerciante_id)
    # Retorna a quantidade de pedidos de um determinado vendedor
    product_ids = Product.where(comerciante_id: comerciante_id).ids
    Order.where(product_id: product_ids).count
  end

  def pedidos_feitos(user_id)
    # Retorna a quantidade de pedidos feita por um determinado usuário
    Order.where(user_id: user_id).count
  end

  def diminui_nome(nome)
    nome.length > 15 ? "#{nome[0..15]}..." : nome
  end
end
