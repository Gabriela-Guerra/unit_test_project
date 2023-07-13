class Conta < ApplicationRecord
    has_many :movimentos
    validates :saldo, numericality: { greater_than_or_equal_to: 0 }
    validates :numero, presence: true, uniqueness: true
    validate :bloqueio_com_saldo_zerado

    def bloqueio_com_saldo_zerado
      if bloqueada? && saldo > 0
        errors.add(:bloqueada, "A conta não pode ser bloqueada com saldo positivo.")
      end
    end
  end
