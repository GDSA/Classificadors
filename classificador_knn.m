%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martín Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy 


function indice=classificador_knn(vNuevo,auxmat,elementsperclasse, k)
[n,m]=size(auxmat);

matriu_diferencia=zeros(1,n);
for i=1:n
     x=auxmat(i,:);
    distancia=sum(abs(x-vNuevo));
    matriu_diferencia(i)=distancia;
   
  
    
end
max1=max(matriu_diferencia)*1000;
contador=1;
contenedor=size(1,k);
while(contador<=k)
    min=matriu_diferencia(1);
    mdmin=1;
    for mm=1:n
        
          if(matriu_diferencia(mm)<min)
               mdmin=mm;
               min=matriu_diferencia(mm);
          end
    end
    contenedor(contador)=mdmin;

    matriu_diferencia(mdmin)=max1;
    contador=contador+1;
    min;
    
end
[wq we]=size(elementsperclasse);
limite=zeros(1,1);
InDice=1;
centinela=zeros(1,k);
for q=1:we
    limite=limite+elementsperclasse(q);
    for as=1:k
        if(contenedor(k)<=limite)
            centinela(InDice)=q;
            InDice=InDice+1;
        end
    end
end
        
    
indice=mode(centinela);

        
    
        
    
