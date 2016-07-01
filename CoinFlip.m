
contador_unos = 0;
contador_dos = 0;

for n = 1:20000

    flip = randi(3); 
    while(flip == 3 )
        flip = randi(3); 
    end
    
    if flip == 1
        contador_unos = contador_unos + 1 ;
    end
    
    if flip == 2
        contador_dos = contador_dos + 1 ; 
    end 
end

y = [contador_unos, contador_dos];
bar(y)
title('Pruebas Algoritmo Aleatorio 2')
xlabel('Resultados') % x-axis label
ylabel('Exitos') % y-axis label