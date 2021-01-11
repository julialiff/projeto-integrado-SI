module ApplicationHelper
  def phone_mask(phone) 
    phone = phone.gsub(/\D/, '')
    if phone.length == 11
      return "(" + phone[0..1] + ") " + phone[2..6] + '-' + phone[7..-1]
    elsif phone.length == 10
      return "(" + phone[0..1] + ") " + phone[2..5] + '-' + phone[6..-1]
    else
      return phone
    end
  end
end
