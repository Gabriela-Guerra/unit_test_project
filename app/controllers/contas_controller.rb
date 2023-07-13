class ContasController < ApplicationController
    def index
      @contas = Conta.all
    end

    def show
      @conta = Conta.find(params[:id])
    end

    def transferencia
      @conta_origem = Conta.find(params[:conta_origem_id])
      @conta_destino = Conta.find(params[:conta_destino_id])
      valor = params[:valor].to_f

      if valor <= 0
        flash[:error] = "O valor da transferência deve ser maior que zero."
        redirect_to @conta_origem
      elsif @conta_origem.saldo < valor
        flash[:error] = "Saldo insuficiente para a transferência."
        redirect_to @conta_origem
      else
        Conta.transaction do
          @conta_origem.update(saldo: @conta_origem.saldo - valor)
          @conta_destino.update(saldo: @conta_destino.saldo + valor)
        end

        flash[:notice] = "Transferência realizada com sucesso."
        redirect_to @conta_origem
      end
    end

    def extrato
      @conta = Conta.find(params[:id])
    end

    def bloquear
      @conta = Conta.find(params[:id])

      if @conta.saldo > 0
        flash[:error] = "A conta não pode ser bloqueada com saldo positivo."
        redirect_to @conta
      else
        @conta.update(bloqueada: true)
        flash[:notice] = "Conta bloqueada com sucesso."
        redirect_to @conta
      end
    end
  end
