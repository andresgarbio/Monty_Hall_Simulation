function GUI_Monty_Hall
% Este programa es una interfaz de usuario acoplada al programa que calcula
% los coeficientes de fourier
usuario = 0;
open_door = 0;
car = 0;

%  Se crea la ventana de interfaz de usuario
g = figure('Visible','off','Position',[360,500,800,650]);

% Se crean y dan las especificaciones de los coponentes

Caja1 = uicontrol('Style','pushbutton',...
             'String','1','Position',[140,425,150,150],...
             'Callback',@Caja1_Callback);
Caja2 = uicontrol('Style','pushbutton',...
             'String','2','Position',[340,425,150,150],...
             'Callback',@Caja2_Callback);
Caja3 = uicontrol('Style','pushbutton',...
             'String','3','Position',[540,425,150,150],...
             'Callback',@Caja3_Callback);
Abre = uicontrol('Style','pushbutton',...
             'String','Abre la puerta','Position',[350,325,100,25],...
             'Callback',@Abre_Callback);


Azar = uicontrol('Style','pushbutton',...
             'String','Azar','Position',[360,240,70,25],...
             'Callback',@Azar_Callback);
Abrir_Todas = uicontrol('Style','pushbutton',...
             'String','Abre todas las puertas','Position',[330,160,170,25],...
             'Callback',@Abrir_Todas_Callback);
Final = uicontrol('Style','pushbutton',...
             'String','Resultado','Position',[300,80,200,75],...
             'Callback',@Final_Callback);
Reiniciar = uicontrol('Style','pushbutton',...
             'String','Reiniciar','Position',[600,50,170,25],...
             'Callback',@Reiniciar_Callback);
         
         
text1  = uicontrol('Style','text','String','1.-Selecciona una puerta haciendo click en ella...',...
           'Position',[260,590,290,15]);
text2  = uicontrol('Style','text','String','2.-Ahora, Monty Hall abrirá una puerta vacía',...
           'Position',[260,370,270,15]);
text3  = uicontrol('Style','text','String','3.-Puedes quedarte asi, seleccionar la otra puerta, o dejarlo al azar',...
           'Position',[100,280,600,15]);
text4  = uicontrol('Style','text','String','4.-¡Vamos a abrir todas las puertas!',...
           'Position',[100,200,600,15]);
autor1  = uicontrol('Style','text','String','Probabilidad y Estadistica / Prof. Ramiro Saldaña / Andres Garcia Rubio / A01231120',...
           'Position',[20,20,800,15]);
text5  = uicontrol('Style','text','String','Bienvenido al show de Monty Hall, detras de una de las 3 puertas hay un premio. Sigue las instrucciones',...
           'Position',[25,620,800,15]);


%Se dan los parametros del grafico y se alinean los botones


% Se normalizan los datos de los componentes para que cambien de tamaño
% automaticamente
Elegir.Units = 'normalized';
Cambiar.Units = 'normalized';
Azar.Units = 'normalized';
text1.Units = 'normalized';
hpopup.Units = 'normalized';
Caja1.Units = 'normalized';
Caja2.Units = 'normalized';
Caja3.Units = 'normalized';
text2.Units = 'normalized';
text3.Units = 'normalized';
text4.Units = 'normalized';
text5.Units = 'normalized';
Reiniciar.Units = 'normalized';
Final.Units = 'normalized';
Abre.Units = 'normalized';
Abrir_Todas.Units = 'normalized';
autor1.Units = 'normalized';

text2.Visible = 'off';
Abre.Visible = 'off';
text3.Visible = 'off';
Azar.Visible = 'off';
text4.Visible = 'off';
Abrir_Todas.Visible = 'off';
Final.Visible = 'off';
Reiniciar.Visible = 'off';


% Se crea un vector para guardar las funciones

% Se pone el nombre dle programa en la ventana principal
g.Name = 'Monty_Hall';

% Se mueve la ventana al centro
movegui(g,'center')

% Se hace visible la ventana
g.Visible = 'on';


%  Pop-up menu callback.Esta funcion corre cada vez que se cambia de
%  funcion en el menu

%El siguiente FOR crea un vector diferente para cada valor k, y los agrega
%a la suma 

  %Se grafica al momento que el usuario oprime el boton calcular
  

  function Caja1_Callback(source,eventdata) 
        Caja1.BackgroundColor = 'g';
        Caja2.BackgroundColor = [.94,.94,.94];
        Caja3.BackgroundColor = [.94,.94,.94];
        usuario = 1;  
        Abre.Visible = 'on';
        text2.Visible = 'on';
        
  end

  function Caja2_Callback(source,eventdata) 
      Caja1.BackgroundColor = [.94,.94,.94];  
      Caja2.BackgroundColor = 'g';
      Caja3.BackgroundColor = [.94,.94,.94];  
      usuario = 2; 
      Abre.Visible = 'on';
      text2.Visible = 'on';
  end

  function Caja3_Callback(source,eventdata) 
      Caja1.BackgroundColor = [.94,.94,.94];  
      Caja2.BackgroundColor = [.94,.94,.94];
      Caja3.BackgroundColor = 'g';
      usuario = 3; 
      Abre.Visible = 'on';
      text2.Visible = 'on';
  end

  function Abre_Callback(source,eventdata) 
      rng('shuffle','twister')
      car = randi(3);
      
      if(car ~= usuario)
            for n = 1:3
                if(n ~= car && n ~= usuario)
                open_door = n;
                end
            end    
      else 
        open_door = randi(3); 
        while(open_door == car )
            open_door = randi(3); 
        end
      end
      
      if open_door == 1 
          Caja1.BackgroundColor = 'y';
          Caja1.String = 'VACIO';
          Caja1.Enable = 'off';
          
      end
      if open_door == 2
          Caja2.BackgroundColor = 'y';
          Caja2.String = 'VACIO';
          Caja2.Enable = 'off';
      end
      if open_door == 3
          Caja3.BackgroundColor = 'y';
          Caja3.String = 'VACIO';
          Caja3.Enable = 'off';
      end
      Abre.Enable = 'off';
      text3.Visible = 'on';
      Azar.Visible = 'on';
      Abrir_Todas.Visible = 'on';
      text4.Visible = 'on';
  end

  function Azar_Callback(source,eventdata)
      
    usuario = randi(3); 
    while(usuario == open_door )
    usuario = randi(3); 
    end  
    
    if usuario == 1 
        Caja1.BackgroundColor = 'g';
        Caja2.BackgroundColor = [.94,.94,.94];
        Caja3.BackgroundColor = [.94,.94,.94];     
    end
    
    if usuario == 2
      Caja1.BackgroundColor = [.94,.94,.94];  
      Caja2.BackgroundColor = 'g';
      Caja3.BackgroundColor = [.94,.94,.94];    
    end
    
    if usuario == 3
      Caja1.BackgroundColor = [.94,.94,.94];  
      Caja2.BackgroundColor = [.94,.94,.94];
      Caja3.BackgroundColor = 'g';   
    end
    
  end

  function Abrir_Todas_Callback(source,eventdata)
      if car == 1 
          Caja1.String = 'PREMIO';
          Caja2.String = 'VACIO';
          Caja3.String = 'VACIO';
          Caja1.Enable = 'off';
          Caja2.Enable = 'off';
          Caja3.Enable = 'off';
          
      end
      if car == 2
          Caja1.String = 'VACIO';
          Caja2.String = 'PREMIO';
          Caja3.String = 'VACIO';
          Caja1.Enable = 'off';
          Caja2.Enable = 'off';
          Caja3.Enable = 'off';
      end
      if car == 3
          Caja1.String = 'VACIO';
          Caja2.String = 'VACIO';
          Caja3.String = 'PREMIO';
          Caja1.Enable = 'off';
          Caja2.Enable = 'off';
          Caja3.Enable = 'off';
      end
      
      if car == usuario
          Final.Visible='on';
          Final.BackgroundColor='g';
          Final.String='GANASTE';
      else
          Final.Visible='on';
          Final.BackgroundColor='r';
          Final.String='PERDISTE';
      end
      Reiniciar.Visible = 'on';
         
    
  end

  function Final_Callback(source,eventdata)
  end

  function Reiniciar_Callback(source,eventdata)
      usuario = 0;
      open_door = 0;
      car = 0;
      Caja1.BackgroundColor = [.94,.94,.94];  
      Caja2.BackgroundColor = [.94,.94,.94]; 
      Caja3.BackgroundColor = [.94,.94,.94]; 
      Final.BackgroundColor = [.94,.94,.94];
      Final.String = 'Resultado';
      Caja1.String = '1';
      Caja2.String = '2';
      Caja3.String = '3';
      Caja1.Enable = 'on';
      Caja2.Enable = 'on';
      Caja3.Enable = 'on';
      text2.Visible = 'off';
      Abre.Visible = 'off';
      text3.Visible = 'off';
      Azar.Visible = 'off';
      text4.Visible = 'off';
      Abrir_Todas.Visible = 'off';
      Final.Visible = 'off';
      Reiniciar.Visible = 'off';
      Abre.Enable = 'on';
      
  end

end