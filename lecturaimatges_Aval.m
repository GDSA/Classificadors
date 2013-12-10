%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martín Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy 


function [nombre,model,H]=lecturaImatges_Aval(directori,flag)

model=[];
nombre=struct;
llegeix = dir(strcat(directori,'\*.jpg')); %el formato de imagen puede ser modificado.



if(flag==0)

    for k = 1:length(llegeix) %recorre tots els arxius de la carpeta
        arxiu = llegeix(k).name; %nom dels arxius
        nom=directori; %nom del directori
        I = rgb2gray(imread(strcat(nom,arxiu)));% llegeix imatge

        H=histograma(I);% extreu caracteristica

        aux=model;%% Això proporciona velocitat, ja que concatenar sobre la mateixa estructura en un bucle no li agrada a matlab
        model= [aux;H]; %%concatena descriptor
        
        [m,n]=size(arxiu);
        pau=arxiu(1:n-4);
        nombre(k).noms=pau;%%enmagatzema el nom

    end





else if (flag==1)
        
        for k = 1:length(llegeix) 
            arxiu = llegeix(k).name;
            nom=directori; 
            I = rgb2gray(imread(strcat(nom,arxiu)));

            H=HOG(I);

                if(mod(k,300)==0) %progres
                     x=num2str(floor(k*100/length(llegeix)));
                       display(strcat(x,'%'));
                end;

            aux=model;
            model= [aux;H];
            [m,n]=size(arxiu);

            pau=arxiu(1:n-4);

            nombre(k).noms=pau;

           
        end
 
    
        
        
        
    
    else if (flag==3)
            
             for k = 1:length(llegeix) 
                arxiu = llegeix(k).name; 
                nom=directori; 
                I = rgb2gray(imread(strcat(nom,arxiu)));

                H=HistogramaBlocs(I); 

                if(mod(k,300)==0)
                    x=num2str(floor(k*100/length(llegeix)));
                    display(strcat(x,'%'));
                end;

                aux=model;
                model= [aux;H];
                [m,n]=size(arxiu);

                pau=arxiu(1:n-4);
                nombre(k).noms=pau;


        end
            
            
            
end; end;end;
