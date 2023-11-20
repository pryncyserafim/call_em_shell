echo "Calculadora em Shell"
echo "Seja bem-vindo a nossa calculadora, escolha uma operação matemática:"
echo "1. Soma"
echo "2. Subtração"
echo "3. Multiplicação"
echo "4. Divisão"
echo "5. Raiz Quadrada"
echo "6. Potência"
read escolha 
echo "digite um número:"
read n1

#ne → É diferente (NotEqual ); && (and); bc(comando para executar cálculos matemáticos)

if [ $escolha -ne 5 ] && [ $escolha -ne 6 ]; then
    echo "digite outro número:"
    read n2
    
fi

case $escolha in
    1)  resultado=$(($n1 + $n2))
        operacao="a soma é:"
        ;;
    2)  resultado=$(($n1 - $n2))
        operacao="a subtração é:"
        ;;
    3)  resultado=$(($n1 * $n2))
        operacao="a multiplicação é:"
        ;;
        
#eq → É igual (EQual)

    4) if [ $n2 -eq 0 ]; then
            echo "Erro na divisão por zero!"
            exit 1
        fi
        resultado=$(echo "scale=2; $n1 / $n2" | bc)
        operacao="a divisão é:"
        ;;
    5)  resultado=$(echo "scale=2; sqrt($n1)" | bc)
        operacao="a raiz quadrada é"
        ;;
    6)  echo "Digite o expoente:"
        read expoente
        resultado=$(echo "$n1 ^ $expoente" | bc)
        operacao=
        ;;
    *)  echo "escolha inválida."
        ;;
        
esac

echo "o resultado da $operacao: $resultado" 
