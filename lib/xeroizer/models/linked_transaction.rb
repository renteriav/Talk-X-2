module Xeroizer
  module Record

    class LinkedTransactionModel < BaseModel

      set_permissions :read, :write, :update
    end

    class LinkedTransaction < Base

      set_primary_key :linked_transaction_id

      guid          :linked_transaction_id
      guid          :source_transaction_id
      guid          :source_line_item_id
      guid          :contact_id
      guid          :target_transaction_id
      guid          :target_line_item_id
      string        :status
      string        :type
      string        :source_transaction_type_code
      datetime_utc  :updated_date_utc, :api_name => 'UpdatedDateUTC'

    end

  end
end
