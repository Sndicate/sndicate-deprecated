class Login < AuthLayout
  def csrf_tag
    @csrf_tag
  end

  def notice
    notice ||= false
  end
end
