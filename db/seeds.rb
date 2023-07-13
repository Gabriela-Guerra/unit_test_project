Movimento.destroy_all
Conta.destroy_all

contas = [
  { numero: '12345', saldo: 0 },
  { numero: '54321', saldo: 100 },
  { numero: '98765', saldo: 50 }
]

contas.each do |conta_params|
  conta = Conta.create(conta_params)
  puts "Conta criada: #{conta.numero}"
end

puts 'Dados das contas foram criados com sucesso!'

contas.each do |conta|
  5.times do |i|
    movimento = Movimento.create(
      conta: conta,
      descricao: "Movimento #{i + 1}",
      valor: rand(-100..100)
    )
    puts "Movimento criado: #{movimento.descricao} - Valor: #{movimento.valor}"
  end
end

puts 'Dados dos movimentos foram criados com sucesso!'
