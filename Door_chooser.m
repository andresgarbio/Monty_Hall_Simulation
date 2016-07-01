contador_unos = 0;
contador_dos = 0;
contador_tres = 0;

for n = 1:40000

    flip = randi(3); 
    
    if flip == 1
        contador_unos = contador_unos + 1 ;
    end
    
    if flip == 2
        contador_dos = contador_dos + 1 ; 
    end 
    
    if flip == 3
        contador_tres = contador_tres + 1 ; 
    end 
end

y = [contador_unos, contador_dos, contador_tres];
bar(y)
title('Pruebas Algoritmo Aleatorio 3')
xlabel('Resultados') % x-axis label
ylabel('Exitos') % y-axis label