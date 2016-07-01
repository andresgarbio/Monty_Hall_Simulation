%Programa que simula el juego Monthy Python

rng('shuffle','twister')

car = randi(3);

str = sprintf('Car is in %d ', car);
disp(str)

player_choice = randi(3);

str = sprintf('Player chose %d ', player_choice);
disp(str)

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

str = sprintf('Opened door %d ', open_door);
disp(str)

for n = 1:3
    if(n ~= open_door && n ~= player_choice)
         player_choice = n;
         break
    end
end   

str = sprintf('New Choice %d ', player_choice);
disp(str)

if(car == player_choice)
    disp('WIN');
else
    disp('LOST');
end