%  Función encargada de simular un movimiento Browniano
%

function onda_madre(varargin)
    onda_madre_j(varargin{1});

function onda_madre_j(j)
% función madre n, depende tanto de n como k

%    t(1)=0;
    numero_muestras=1000;   %    Defino el número de muestras [0 .. 1]
%     limite_sup = 2^j*round((numero_muestras)/2^j);    
    t=zeros(numero_muestras,1);
    for i=2:1:numero_muestras   %    construyo el vector de tiempo
        t(i) = t(i-1)+1/numero_muestras;
    end

    for i=1:1:numero_muestras    %   Construyo la honda madre original
        if t(i) <= 0.5
            h(i) = 1;
        else
            h(i) = -1;
        end    
    end
    
    k_esimo = 2^j;          % calculo el K'esismo elemento 
    k=zeros(k_esimo,1);
    for i=0:1:k_esimo-1
        k(i+1)=i; 
    end                     %  0 <= k < 2^j

    num_k=size(k,1);
    n = zeros(num_k,1);
    for z=1:1:num_k
        n(z)= 2^j + k(z);
    end                     % n = 2^j + k
%    rango_total = 101;
    rango = round(numero_muestras/(2^j));
    h_n = zeros(num_k,1);
    
    for w=1:1:num_k
        for i=1+(rango)*(w-1):1:rango+(rango)*(w-1)
            h_n(i) = (2^(j/2))*h((2^j)*i-k(w)*(numero_muestras));
        end        
        plot(h_n);
    end
 
    