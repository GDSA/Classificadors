clear all


%Leemos nuestro txt de Clasificacion

fid= fopen('21.txt');
M = textscan(fid, '%s%s');
fclose(fid);

    id21 = M{1};
    clas21 = M{2};
 map21 = containers.Map(id21,clas21); % los guardamos en mapa
clear M fid 

%Leemos txt de los demas
fid= fopen('33.txt');
M = textscan(fid, '%s%s');
fclose(fid);

    id33 = M{1};
    clas33 = M{2};
map33 = containers.Map(id33,clas33); % los guardamos en mapa
clear M fid 

fid= fopen('31.txt');
M = textscan(fid, '%s%s');
fclose(fid);

    id31 = M{1};
    clas31 = M{2};
map31 = containers.Map(id31,clas31); % los guardamos en mapa
clear M fid 

hola=0;
hola2=0;
archivo=fopen(strcat('resultatsKNN.txt'),'w');
for i=1:length(id21),  
id=id21{i}; %% leemos id
type21=clas21{i};  %% obtenemos su event_type
type31=map31(id); %% obtenemos el event type de 31 y 33 (los dos mejores grupos de textual)
type33=map33(id);
if (strcmp(type21,type31) && strcmp(type21,type33) && strcmp(type31, type33)), hola=hola+1;

  fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,type21);
    fprintf(archivo,'\r\n');%% si coincidimos los tres, casi seguro que está bien


else if ( ~strcmp(type21,type31) && strcmp(type31, type33)),    %% sino, knn
        
        fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,type31);
    fprintf(archivo,'\r\n');
    
    
    else if( strcmp(type21, type33)),
             fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,type33);
    fprintf(archivo,'\r\n');
        
        else if( strcmp(type21, type31)),
             fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,type31);
    fprintf(archivo,'\r\n');
    
    else if( strcmp(type33,type31) ),
             fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,type31);
    fprintf(archivo,'\r\n');
  
    
        else %% si no coincidimos nadie hacemos uso de la "conocida" distribución de probabilidad  donde hay un 80% de non_ event, que es 
            % lo que han hecho algunos de los grupos de textual, cuando
            % en principio no nos deberíamos de basar nunca en datos
            % desconocidos para crear un clasificador.
             fprintf(archivo,id21{i});
    fprintf(archivo,' ');
    fprintf(archivo,'non_event');
    fprintf(archivo,'\r\n'); 
         end;
        end; end;end;
       
end;
end;
fclose(archivo);
