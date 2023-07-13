require 'rails_helper'

RSpec.describe Conta, type: :model do
  describe "validations" do
    it { should validate_presence_of(:numero) }
    it { should validate_uniqueness_of(:numero) }
    it { should validate_numericality_of(:saldo).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should have_many(:movimentos) }
  end

  describe "custom methods" do
    describe "#bloqueio_com_saldo_zerado" do
      let(:conta) { create(:conta, saldo: 0) }

      context "when blocking an account with zero balance" do
        before { conta.bloquear }

        it "blocks the account" do
          expect(conta.bloqueada?).to be true
        end
      end

      context "when blocking an account with positive balance" do
        before { conta.update(saldo: 100) }

        it "returns an error" do
          expect { conta.bloquear }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
