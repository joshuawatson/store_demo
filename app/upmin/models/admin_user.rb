class AdminUser < Upmin::Model
  actions :reset_password, :issue_coupon, :issue_free_shipping_coupon
end
