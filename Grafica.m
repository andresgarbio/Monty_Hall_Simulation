%Programa que simula el juego Monthy Python

rng('shuffle','twister')

trials = 1000000;

stay = 0;
cambia = 0;
moneda = 0;

for n = 1:trials

car = randi(3);

player_choice = randi(3);

open_Door = 0;

if(car ~= player_choice)
    for n = 1:3
        if(n ~= car && n ~= player_choice)
         open_door = n;
        end
    end    
else 
    open_door = randi(3); 
    while(open_door == car )
        open_door = randi(3); 
    end
end


if(car == player_choice)
    stay = stay + 1;
end

end

for n = 1:trials

car = randi(3);

player_choice = randi(3);

open_Door = 0;

if(car ~= player_choice)
    for n = 1:3
        if(n ~= car && n ~= player_choice)
         open_door = n;
        end
    end    
else 
    open_door = randi(3); 
    while(open_door == car )
        open_door = randi(3); 
    end
end

for n = 1:3
    if(n ~= open_door && n ~= player_choice)
         player_choice = n;
         break
    end
end   

if(car == player_choice)
    cambia = cambia + 1;
end


end

for n = 1:trials
    car = randi(3);

player_choice = randi(3);

open_Door = 0;

if(car ~= player_choice)
    for n = 1:3
        if(n ~= car && n ~= player_choice)
         open_door = n;
        end
    end    
else 
    open_door = randi(3); 
    while(open_door == car )
        open_door = randi(3); 
    end
end

player_choice = randi(3); 
while(player_choice == open_door )
    player_choice = randi(3); 
end  

if(car == player_choice)
    moneda = moneda + 1 ;
end
end

bar([stay, cambia, moneda]);
title('Resultados Monty Hall');
nombres = {'Se queda'; 'Cambia'; 'Al Azar'};
set(gca,'xticklabel',nombres);
ylabel('exitos') % y-axis label