require 'xeroizer/models/attachment'

module Xeroizer
  module Record
    class BankTransferModel < BaseModel
      set_permissions :read, :write

      include AttachmentModel::Extensions
    end

    class BankTransfer < Base

      include Attachment::Extensions

      def initialize(parent)
        super parent
      end

      set_primary_key :bank_transfer_id
      list_contains_summary_only true

      date :date

      datetime_utc  :created_date_utc, :api_name => "CreatedDateUTC"
      decimal       :amount
      string        :bank_transfer_id, :api_name => "BankTransferID"
      string        :from_bank_transaction_id, :api_name => "FromBankTransactionID"
      string        :to_bank_transaction_id, :api_name => "ToBankTransactionID"
      decimal       :currency_rate

      belongs_to :from_bank_account, :model_name => 'FromBankAccount'
      belongs_to :to_bank_account, :model_name => 'ToBankAccount'

      validates_presence_of :from_bank_account, :to_bank_account, :allow_blanks => false    
    end
  end
end
