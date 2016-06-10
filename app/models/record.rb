class Record < ActiveRecord::Base
  before_create :generate_coupon_code

  def self.to_csv
    CSV.generate do |csv|
      csv << ['post_title', 'post_excerpt', 'post_status', 'post_parent', 'menu_order',
              'post_date','discount_type', 'coupon_amount', 'free_shipping', 'expiry_date',
              'minimum_amount','maximum_amount', 'individual_use', 'exclude_sale_items', 'product_ids',
              'exclude_product_ids','product_categories', 'exclude_product_categories', 'customer_email', 'usage_limit',
              'usage_limit_per_user', 'limit_usage_to_x_items', 'sc_coupon_validity', 'validity_suffix',
              'auto_generate_coupon','coupon_title_prefix', 'coupon_title_suffix', 'is_pick_price_of_product', 'sc_disable_email_restriction',
              'sc_is_visible_storewide']
      all.each do |record|
        # csv << record.attributes.values_at(*column_names)
        # puts "-----------------------------------------------------------------"
        # # puts "record.attributes.values_at(*column_names) = #{record.attributes.values_at(*column_names)}"
        # puts "-----------------------------------------------------------------"
        csv << [record.coupon_code, '', 'publish', '', '',
<<<<<<< HEAD
                '', 'Cart Discount', '100', 'no', '9/11/16',
=======
                '', 'Cart Discount', '100', 'no', '11/09/16',
>>>>>>> 4e2f2a6263ce8f4b1106ccd1255db8a5d177dad4
                '', '', 'no', 'no', '',
                '4596|3076|4597', '', '', record.email, '',
                '1', '', '', 'days', '',
                'EPS', 'GWD', 'no', 'no', 'no']
      end
    end
  end

  protected
    # generates and assigns unique coupon code
    def generate_coupon_code
      self.coupon_code = loop do
        generated_code = "eps57554e2" + SecureRandom.hex(3) + "gwd"
        break generated_code unless Record.exists?(coupon_code: generated_code)
      end
    end
end
