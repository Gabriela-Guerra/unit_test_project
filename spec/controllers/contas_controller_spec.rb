require 'rails_helper'

RSpec.describe ContasController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all contas to @contas' do
      conta1 = Conta.create(numero: '123')
      conta2 = Conta.create(numero: '456')
      get :index
      expect(assigns(:contas)).to match_array([conta1, conta2])
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      conta = Conta.create(numero: '123')
      get :show, params: { id: conta.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested conta to @conta' do
      conta = Conta.create(numero: '123')
      get :show, params: { id: conta.id }
      expect(assigns(:conta)).to eq(conta)
    end
  end

  describe 'POST #transferencia' do
    let(:conta_origem) { Conta.create(numero: '123', saldo: 100.0) }
    let(:conta_destino) { Conta.create(numero: '456', saldo: 0.0) }

    it 'redirects to conta_origem on successful transferencia' do
      post :transferencia, params: { conta_origem_id: conta_origem.id, conta_destino_id: conta_destino.id, valor: 50.0 }
      expect(response).to redirect_to(conta_origem)
    end

    it 'updates the saldo of conta_origem and conta_destino' do
      post :transferencia, params: { conta_origem_id: conta_origem.id, conta_destino_id: conta_destino.id, valor: 50.0 }
      conta_origem.reload
      conta_destino.reload
      expect(conta_origem.saldo).to eq(50.0)
      expect(conta_destino.saldo).to eq(50.0)
    end

    it 'shows flash error and redirects to conta_origem if valor is negative' do
      post :transferencia, params: { conta_origem_id: conta_origem.id, conta_destino_id: conta_destino.id, valor: -50.0 }
      expect(flash[:error]).to eq('O valor da transferência deve ser maior que zero.')
      expect(response).to redirect_to(conta_origem)
    end

    it 'shows flash error and redirects to conta_origem if saldo is insufficient' do
      post :transferencia, params: { conta_origem_id: conta_origem.id, conta_destino_id: conta_destino.id, valor: 150.0 }
      expect(flash[:error]).to eq('Saldo insuficiente para a transferência.')
      expect(response).to redirect_to(conta_origem)
    end
  end

  describe 'GET #extrato' do
    let(:conta) { Conta.create(numero: '123') }
    let!(:movimento1) { Movimento.create(conta: conta, descricao: 'Débito', valor: -50.0) }
    let!(:movimento2) { Movimento.create(conta: conta, descricao: 'Crédito', valor: 100.0) }

    it 'renders the extrato template' do
      get :extrato, params: { id: conta.id }
      expect(response).to render_template(:extrato)
    end

    it 'assigns the requested conta to @conta' do
      get :extrato, params: { id: conta.id }
      expect(assigns(:conta)).to eq(conta)
    end

    it 'assigns the movimentos of the conta to @movimentos' do
      get :extrato, params: { id: conta.id }
      expect(assigns(:movimentos)).to match_array([movimento1, movimento2])
    end
  end

  describe 'PATCH #bloquear' do
    let(:conta) { Conta.create(numero: '123', saldo: 0.0) }

    it 'redirects to conta on successful bloquear' do
      patch :bloquear, params: { id: conta.id }
      expect(response).to redirect_to(conta)
    end

    it 'updates the bloqueada attribute of the conta' do
      expect {
        patch :bloquear, params: { id: conta.id }
        conta.reload
      }.to change { conta.bloqueada }.from(false).to(true)
    end

    it 'shows flash error and redirects to conta if saldo is positive' do
      conta.update(saldo: 100.0)
      patch :bloquear, params: { id: conta.id }
      expect(flash[:error]).to eq('A conta não pode ser bloqueada com saldo positivo.')
      expect(response).to redirect_to(conta)
    end
  end
end
